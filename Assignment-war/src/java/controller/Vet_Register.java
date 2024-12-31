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
import model.Vets;
import model.VetsFacade;

/**
 *
 * 
 */
@WebServlet(name = "Vet_Register", urlPatterns = {"/Vet_Register"})
public class Vet_Register extends HttpServlet {

    @EJB
    private VetsFacade vetsFacade;
    
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
        
        String a = request.getParameter("username");
        String b = request.getParameter("password");
        String c = request.getParameter("confirmPassword");
        String d = request.getParameter("expertise1");
        String f = request.getParameter("expertise2");
        String g = request.getParameter("email");
        
        try (PrintWriter out = response.getWriter()) {
            try {
                Vets found = vetsFacade.find(a);
                if (found != null) {
                    throw new IllegalArgumentException("Username already exists.");
                }
                if(b.length() == 00){
                    throw new Exception("Invalid Password: Password cannot be empty.");
                } 
                if(!c.equals(b)){
                    throw new Exception("Password does not match, please try again.");
                }
                if(d.equals(f)){
                    throw new Exception("Expertise cannot be the same.");
                }
                vetsFacade.create(new Vets(a, b, g, d, f));
                request.getRequestDispatcher("vet_Login.jsp").include(request, response);
                out.println("<br><br><br> Hi " + a + ", your registration is successful.");
            } catch (IllegalArgumentException e) {
                request.getRequestDispatcher("vet_Register.jsp").include(request, response);
                out.println("<br><br><br> Sorry " + a + ", " + e.getMessage());
            } catch (Exception e) {
                request.getRequestDispatcher("vet_Register.jsp").include(request, response);
                out.println("<br><br><br> Sorry " + a + ", an error occurred during registration: " + e.getMessage());
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
