/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import static com.sun.org.apache.xalan.internal.xsltc.compiler.util.Type.Int;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
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
import model.StaffFacade;
import model.Vets;
import model.VetsFacade;
import model.WorkingRota;
import model.WorkingRotaFacade;

/**
 *
 * 
 */
@WebServlet(name = "staff_CreateReport", urlPatterns = {"/staff_CreateReport"})
public class staff_CreateReport extends HttpServlet {

    @EJB
    private WorkingRotaFacade workingRotaFacade;

    @EJB
    private DiagnosisFacade diagnosisFacade;

    @EJB
    private AppointmentsFacade appointmentsFacade;
    
    @EJB
    private VetsFacade vetsFacade;
    
    @EJB
    private StaffFacade staffFacade;

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
        HttpSession s = request.getSession(false);
        
        // Get total appointment count
        int appointmentsCount = appointmentsFacade.findAll().size();
        s.setAttribute("appointmentsCount", appointmentsCount);
        
        // get total Diagnosis Count
        int diagnosisCount = diagnosisFacade.findAll().size();
        s.setAttribute("diagnosisCount", diagnosisCount);
        
        // Get total Weekly rota report
        List<WorkingRota> vetWeekRota = workingRotaFacade.findAll();
        HashMap<String, String> vetsCount = new HashMap<String, String>();
        for(WorkingRota i : vetWeekRota){
            vetsCount.put(i.getVet(), "");
        }
        int vetsUniqueCount = vetsCount.size();
        s.setAttribute("vetsUniqueCount", vetsUniqueCount);
        
        // Get total employees count (from staff and vets facade)
        int staffCount = staffFacade.findAll().size();
        int vetCount = vetsFacade.findAll().size();
        int totalEmployeesCount = staffCount + vetCount;
        s.setAttribute("totalEmployeesCount", totalEmployeesCount);
        
        
        // Get total unique Expertise Count (add from Expertise1 & Expertise2 from Vets facade)
        List<Vets> allVets = vetsFacade.findAll();
        HashMap<String, String> uniqueExpertise = new HashMap<String, String>();
        for (Vets vet : allVets) {
            uniqueExpertise.put(vet.getExpertise1(), "");
            uniqueExpertise.put(vet.getExpertise2(), "");
        }
        int totalUniqueExpertiseCount = uniqueExpertise.size();
        s.setAttribute("totalUniqueExpertiseCount", totalUniqueExpertiseCount);
        
        request.getRequestDispatcher("staff_CreateReport.jsp").include(request, response);
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
