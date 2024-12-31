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
import model.Appointments;
import model.AppointmentsFacade;
import model.Pets;
import model.PetsFacade;
import model.Vets;
import model.VetsFacade;

/**
 *
 * 
 */
@WebServlet(name = "EditAndCancelAppointments", urlPatterns = {"/EditAndCancelAppointments"})
public class EditAndCancelAppointments extends HttpServlet {

    @EJB
    private VetsFacade vetsFacade;

    @EJB
    private PetsFacade petsFacade;

    @EJB
    private AppointmentsFacade appointmentsFacade;

    
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
    
    String action = request.getParameter("action");
    String id = request.getParameter("appointmentId");

    try (PrintWriter out = response.getWriter()) {
        
        if ("edit".equals(action)) {
            // Assuming you have the logic to handle editing here
            String aptDate = request.getParameter("appointmentDate");
            String aptTime = request.getParameter("appointmentTime");
            String petName = request.getParameter("petName");
            String vetName = request.getParameter("vetName");
            
            Pets petsFound = petsFacade.find(petName);
            
            Vets vetsFound = vetsFacade.find(vetName);
            Appointments appointmentToEdit = appointmentsFacade.find(Long.parseLong(id)); // Ensure correct type casting
            if (appointmentToEdit != null) {
                appointmentToEdit.setAppointmentDate(aptDate);
                appointmentToEdit.setAppointmentTime(aptTime);
                appointmentToEdit.setPet(petsFound);
                appointmentToEdit.setVet(vetsFound);
                appointmentsFacade.edit(appointmentToEdit);
                response.sendRedirect("receptionists_ManageAppointments_EditAppointment");
            } else {
                request.getRequestDispatcher("receptionists_ManageAppointments_EditAppointment.jsp").include(request, response);
                out.println("<br><br><br> Appointment not found, please try again.");
            }
        } else if ("cancel".equals(action)) {
            Appointments appointmentToDelete = appointmentsFacade.find(Long.parseLong(id)); // Ensure correct type casting
            if (appointmentToDelete != null) {
                appointmentsFacade.remove(appointmentToDelete);
                response.sendRedirect("receptionists_ManageAppointments_EditAppointment");
            } else {
                request.getRequestDispatcher("receptionists_ManageAppointments_MakeAppointment.jsp").include(request, response);
                out.println("<br><br><br> Appointment not found, please try again.");
            }
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
