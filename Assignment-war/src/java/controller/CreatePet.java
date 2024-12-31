/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Customers;
import model.CustomersFacade;
import model.Pets;
import model.PetsFacade;
import model.Receptions;

/**
 *
 * 
 */
@WebServlet(name = "CreatePet", urlPatterns = {"/CreatePet"})
public class CreatePet extends HttpServlet {

    @EJB
    private CustomersFacade customersFacade;

    @EJB
    private PetsFacade petsFacade;
    
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
        
        String a = request.getParameter("petName");
        String b = request.getParameter("owner");
        HttpSession s = request.getSession(false);
        Receptions user = (Receptions) s.getAttribute("user");
        
        try (PrintWriter out = response.getWriter()) {
            
            Customers customerFound = customersFacade.find(b);
            try{
                if(a.length() == 0){
                    throw new Exception("Name cannot be empty.");
                }
                Pets found = petsFacade.find(a);
                if (found != null) {
                    throw new IllegalArgumentException("Pet name already exists.");
                }
                petsFacade.create(new Pets(a, customerFound));
                // Redirect to the same page after successful creation
                request.getRequestDispatcher("receptionists_CreatePet.jsp").include(request, response);
                out.println("<br><br><br> Pet successfully created");
            } catch (IllegalArgumentException e) {
                request.getRequestDispatcher("receptionists_CreatePet.jsp").include(request, response);
                out.println("<br><br><br> Sorry " + a + ", " + e.getMessage());
            } catch (Exception e) {
                request.getRequestDispatcher("receptionists_CreatePet.jsp").include(request, response);
                out.println("<br><br><br> Sorry " + a + ", " + e.getMessage());
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
