/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.sync;

import dal.AccountDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Account;

/**
 *
 * @author DELL
 */
public class LoginController extends HttpServlet {

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
        //kiểm tra cookie
        Cookie[] cookies = request.getCookies();
        String username = null;
        String password = null;
        for (Cookie cooky : cookies) {
            if (cooky.getName().equals("username")) {
                username = cooky.getValue();
            }
            if (cooky.getName().equals("password")) {
                password = cooky.getValue();
            }
            if (username != null && password != null) {
                break;
            }
        }

        if (username != null && password != null) {
            Account account = new AccountDAO().login(username, password);
            if (account != null) { //cookie hợp lệ
                request.getSession().setAttribute("account", account);
                response.sendRedirect("home");
                return;
            }
        }
        request.getRequestDispatcher("login.jsp").forward(request, response);
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
        //Check Login
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        boolean remember = request.getParameter("remember") != null;

        //Check username, password
        Account account = new AccountDAO().login(username, password);
        if (account != null) { //hợp lệ >> lưu lên session
            //remember
            if (remember) {
                Cookie usernameCookie = new Cookie("username", username);
                usernameCookie.setMaxAge(60 * 60 * 24 * 2);
                Cookie passwordCookie = new Cookie("password", password);
                usernameCookie.setMaxAge(60 * 60 * 24 * 2);
                response.addCookie(usernameCookie);
                response.addCookie(passwordCookie);

            }
            request.getSession().setAttribute("account", account);
            response.sendRedirect("home");

            //not remember
        } else { //không hợp lệ >> trả vể lỗi
            request.setAttribute("error", "Username or Password incorrect !");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
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
