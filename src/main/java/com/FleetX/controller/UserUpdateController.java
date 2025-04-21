package com.FleetX.controller;

import jakarta.servlet.ServletException;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.FleetX.model.UserModel;
import com.FleetX.service.UserService;
import com.FleetX.util.PasswordUtil;

/**
 * Servlet implementation class UserUpdateController
 */
@WebServlet("/userUpdate")
public class UserUpdateController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String fname = request.getParameter("fname");
        String lname = request.getParameter("lname");
        String uname = request.getParameter("username");
        String dob = request.getParameter("dob");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String password = request.getParameter("password");
        String role = request.getParameter("role"); // in case you want to preserve the role

        password = PasswordUtil.encrypt(uname, password);

        UserModel userModel = new UserModel(fname, lname, uname, dob, email, phone, password, role);

        boolean success = new UserService().updateUserProfile(userModel);

        if (success) {
            request.setAttribute("status", "updated");
            request.getRequestDispatcher("/WEB-INF/Pages/home.jsp").forward(request, response);
        } else {
            request.setAttribute("status", "failed");
            request.getRequestDispatcher("/WEB-INF/Pages/userProfilePage.jsp").forward(request, response);
        }

    }

}
