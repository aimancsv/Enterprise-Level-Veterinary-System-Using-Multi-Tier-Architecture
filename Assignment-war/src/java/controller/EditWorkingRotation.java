/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.VetsFacade;
import model.WorkingRota;
import model.WorkingRotaFacade;
import java.util.Calendar;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;
import model.Vets;

/**
 *
 * 
 */

@WebServlet(name = "EditWorkingRotation", urlPatterns = {"/EditWorkingRotation"})
public class EditWorkingRotation extends HttpServlet {

    @EJB
    private VetsFacade vetsFacade;

    @EJB
    private WorkingRotaFacade workingRotaFacade;
    
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
        
        Calendar cal = Calendar.getInstance();
        cal.add(Calendar.DATE, 7);
        int nextWeekNumber = cal.get(Calendar.WEEK_OF_YEAR);
        
        List<Vets> vets = vetsFacade.findAll();
        
        List<String> expertiseListEachDay = new ArrayList<>();
        List<String> vetListEachDay = new ArrayList<>();
        
        try (PrintWriter out = response.getWriter()) {
            if (workingRotaFacade.weekNumberExists(nextWeekNumber)) {
                request.getRequestDispatcher("staff_CreateWorkingRota.jsp").include(request, response);
                out.println("<br><br><br> Week number " + nextWeekNumber + " already exists in the database.");
                return;
            }

        
        for  (int i = 0; i < 7; i++) {
            String day = Arrays.asList("Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday").get(i);
            expertiseListEachDay.clear();
            vetListEachDay.clear();
            for (Vets vet : vets){
                String paramName = vet.getId() + "_" + day;
                
                if (request.getParameter(paramName) != null) {
                    if(!expertiseListEachDay.contains(vet.getExpertise1())){
                        expertiseListEachDay.add(vet.getExpertise1());
                    }
                    vetListEachDay.add(vet.getId());
                    if(!"".equals(vet.getExpertise2()) && !expertiseListEachDay.contains(vet.getExpertise2())){
                        expertiseListEachDay.add(vet.getExpertise2());
                    }
                }
                

            }
            if(expertiseListEachDay.size() < 5){
                    request.getRequestDispatcher("staff_CreateWorkingRota.jsp").include(request, response);
                    out.println("<br><br><br>" + day + " does not have 5 unique expertise.");
                    return;
                }
        }
        
        for (Vets vet : vets) {
            List<String> daysList = new ArrayList<>();
            for (int i = 0; i < 7; i++) {
                String day = Arrays.asList("Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday").get(i);

                String paramName = vet.getId() + "_" + day;

                if (request.getParameter(paramName) != null) {
                    daysList.add(day);
                }
            }

            String[] daysArray = daysList.toArray(new String[0]);

            List<String> days = Arrays.asList(daysArray);

            int weekNumber = nextWeekNumber; 

            WorkingRota workingRota = new WorkingRota();
            workingRota.setVet(vet.getId());
            workingRota.setDays(days);
            workingRota.setWeekNumber(weekNumber);

            workingRotaFacade.create(workingRota);
        }

        response.sendRedirect("staff_CreateWorkingRota"); // Redirect back to the page after saving
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