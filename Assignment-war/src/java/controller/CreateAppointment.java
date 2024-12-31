/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
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
@WebServlet(name = "CreateAppointment", urlPatterns = {"/CreateAppointment"})
public class CreateAppointment extends HttpServlet {

    @EJB
    private VetsFacade vetsFacade;

    @EJB
    private AppointmentsFacade appointmentsFacade;

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
    String a = request.getParameter("appointmentDate");
    String b = request.getParameter("appointmentTime");
    String c = request.getParameter("petName");
    String d = request.getParameter("vetName");
    try (PrintWriter out = response.getWriter()) {
        try{
            Date currentDate = new Date();
            
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
            Date appointmentDate = dateFormat.parse(a);
            
            Pets petsFound = petsFacade.find(c);
            
            Vets vetsFound = vetsFacade.find(d);
            if (appointmentDate.after(currentDate)) {
                appointmentsFacade.create(new Appointments(vetsFound,petsFound, a, b));
                request.getRequestDispatcher("receptionists_ManageAppointments_MakeAppointment.jsp").include(request, response);
                out.println("<br><br><br> Registration of appointment for " + c + " is successful.");
            } else {
                request.getRequestDispatcher("receptionists_ManageAppointments_MakeAppointment.jsp").include(request, response);
                out.println("<br><br><br> Appointment date must be after today's date.");
            }
        }catch (ParseException ex) {
        out.println("<br><br><br> Error parsing appointment date.");
        ex.printStackTrace(out);
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
