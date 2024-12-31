package controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Staff;
import model.StaffFacade;

@WebServlet(name = "Staff_Login", urlPatterns = {"/Staff_Login"})
public class Staff_Login extends HttpServlet {

    @EJB
    private StaffFacade staffFacade;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        try (PrintWriter out = response.getWriter()) {
            try {
                Staff found = staffFacade.find(username);
                if (found == null) {
                    throw new IllegalArgumentException("Invalid Username, please try again.");
                }
                if (!found.getPassword().equals(password)) {
                    throw new IllegalArgumentException("Wrong Password, please try again.");
                }
                // Check if role is "Super Admin" to route to superAdmin.jsp
                if (found.getRole().equals("Super Admin")) {
                    request.getRequestDispatcher("superAdmin.jsp").forward(request, response);
                } else {
                    request.getRequestDispatcher("staff_HomePage.jsp").forward(request, response);
                }
            } catch (IllegalArgumentException e) {
                request.getRequestDispatcher("staff_Login.jsp").include(request, response);
                out.println("<br><br><br> Sorry " + username + ", " + e.getMessage());
            } catch (Exception e) {
                request.getRequestDispatcher("staff_Login.jsp").include(request, response);
                out.println("<br><br><br> Sorry " + username + ", an error occurred during login: " + e.getMessage());
            }
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
