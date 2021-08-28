package com.qasurgetechnologies.blog.servlets;

import com.qasurgetechnologies.blog.entities.User;
import com.qasurgetechnologies.blog.helper.ConnectionProvider;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.qasurgetechnologies.blog.dao.UserDao;

/**
 *
 * @author X012939
 */
@MultipartConfig
@WebServlet(name = "signUpServlet", urlPatterns = {"/signUpServlet"})
public class signUpServlet extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            String check = request.getParameter("check");
            if (check == null) {
                out.println("Box not checked");
            } else {
                String name = request.getParameter("username");
                String email = request.getParameter("mail1");
                String password = request.getParameter("password");
                String gender = request.getParameter("gender");

                User user = new User(name, email, password, gender);
                UserDao userDao = new UserDao(ConnectionProvider.getConnection());
                boolean flag = userDao.insertUserRecords(user);

                if (flag) {
                    out.println("Data is inserted successfully");
                } else {
                    out.println("Data is not inserted");
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
