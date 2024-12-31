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
import model.Appointments;
import model.AppointmentsFacade;
import model.Diagnosis;
import model.DiagnosisFacade;
import model.Vets;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import model.Pets;
import model.PetsFacade;
/**
 *
 * 
 */
@WebServlet(name = "CreateDiagnosis", urlPatterns = {"/CreateDiagnosis"})
public class CreateDiagnosis extends HttpServlet {

    @EJB
    private PetsFacade petsFacade;

    @EJB
    private AppointmentsFacade appointmentsFacade;

    @EJB
    private DiagnosisFacade diagnosisFacade;
    
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
        
        String a = request.getParameter("appointmentId");
        String b = request.getParameter("petId");
        String c = request.getParameter("diagnosis");
        
        HttpSession session = request.getSession(); 
        Vets vet = (Vets) session.getAttribute("vet"); 
        
        LocalDateTime currentDateAndTime = LocalDateTime.now();
        
        DateTimeFormatter dateFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        DateTimeFormatter timeFormatter = DateTimeFormatter.ofPattern("HH:mm:ss");

        String currentDate = currentDateAndTime.format(dateFormatter);
        String currentTime = currentDateAndTime.format(timeFormatter);
        
        try (PrintWriter out = response.getWriter()) {
            
            if(a == null){
                request.getRequestDispatcher("vet_Diagnosis.jsp").include(request, response);
                out.println("<br><br><br> Please choose what type of appointment.");
            }
            if (b == null){
                Appointments appointment = appointmentsFacade.find(Long.parseLong(a));
                Pets pet = appointment.getPet();
                b = pet.getId();
                diagnosisFacade.create(new Diagnosis(vet,pet,a,c,currentDate,currentTime));
                request.getRequestDispatcher("vet_Diagnosis_Appointment.jsp").include(request, response);
                out.println("<br><br><br> Diagnosis Successfully added.");
                return;
            }
            Pets petsFound = petsFacade.find(b);
            diagnosisFacade.create(new Diagnosis(vet,petsFound,a,c,currentDate,currentTime));
            request.getRequestDispatcher("vet_Diagnosis_WalkIn.jsp").include(request, response);
            out.println("<br><br><br> Diagnosis Successfully added.");
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
