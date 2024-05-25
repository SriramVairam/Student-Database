package com.example;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AddStudentServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        int age = Integer.parseInt(request.getParameter("age"));
        String dob = request.getParameter("dob");
        String sex = request.getParameter("sex");
        String department = request.getParameter("department");
        String phone = request.getParameter("phone");

        try {
            // Load MySQL JDBC Driver
            Class.forName("com.mysql.cj.jdbc.Driver");
            
            // Connect to the database
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/student_register", "root", "3903");
            String query = "INSERT INTO students (name, age, dob, sex, department, phone) VALUES (?, ?, ?, ?, ?, ?)";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, name);
            ps.setInt(2, age);
            ps.setString(3, dob);
            ps.setString(4, sex);
            ps.setString(5, department);
            ps.setString(6, phone);
            ps.executeUpdate();
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        response.sendRedirect("index.html");
    }
}
