/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Receptions;
import model.ReceptionsFacade;
import model.Vets;
import model.VetsFacade;

/**
 *
 * 
 */
@WebServlet(name = "ManageOwnAccount", urlPatterns = {"/ManageOwnAccount"})
public class ManageOwnAccount extends HttpServlet {

    @EJB
    private VetsFacade vetsFacade;

    @EJB
    private ReceptionsFacade receptionsFacade;

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        String a = request.getParameter("password");
        String b = request.getParameter("confirmPassword");
        String c = request.getParameter("oldPassword");
                
        HttpSession session = request.getSession(); // Get the current HTTP session.
        Vets vet = (Vets) session.getAttribute("vet"); // Retrieve the vet object stored in session.
        Receptions reception = (Receptions) session.getAttribute("user");
        
        try (PrintWriter out = response.getWriter()) {
            String userId = null;

            if (vet != null) {
                userId = vet.getId();
            } else if (reception != null) {
                userId = reception.getId();
            }
            if (userId != null) {
                if (!a.equals(b)) {
                    request.getRequestDispatcher("vet_Register.jsp").include(request, response);
                    out.println("<br><br><br> Sorry " + userId + ", Password does not match");
                }

                if (vet != null) {
                    Vets loggedInUser = vetsFacade.find(userId);
                    if(loggedInUser.getPassword().equals(c)){
                        loggedInUser.setPassword(a);
                        vetsFacade.edit(loggedInUser);
                        request.getRequestDispatcher("vet_ManageOwnAccount.jsp").include(request, response);
                    }else{
                        request.getRequestDispatcher("vet_ManageOwnAccount.jsp").include(request, response);
                        out.println("<br><br><br> Old password does not match, please try again");
                        return;
                    }
                } else if (reception != null) {
                    Receptions loggedInUser = receptionsFacade.find(userId);
                    if(loggedInUser.getPassword().equals(c)){
                        loggedInUser.setPassword(a);
                        receptionsFacade.edit(loggedInUser);
                        request.getRequestDispatcher("receptionists_ManageOwnAccount.jsp").include(request, response);
                    }else{
                        request.getRequestDispatcher("receptionists_ManageOwnAccount.jsp").include(request, response);
                        out.println("<br><br><br> Old password does not match, please try again");
                        return;
                    }
                }

                out.println("<br><br><br> Password has successfully changed");
            }
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
