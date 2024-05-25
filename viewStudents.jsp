<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.util.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Student Details</title>
    <link rel="stylesheet" type="text/css" href="css/view student.css">
</head>
<body>
    <div class="container">
        <h1>Student Details</h1>
        <div class="table-container">
            <table>
                <tr>
                    <th>Name</th>
                    <th>Age</th>
                    <th>Date of Birth</th>
                    <th>Sex</th>
                    <th>Department</th>
                    <th>Phone Number</th>
                </tr>
                <%
                    try {
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/student_register", "root", "3903");
                        Statement stmt = con.createStatement();
                        ResultSet rs = stmt.executeQuery("SELECT * FROM students");
                        while (rs.next()) {
                            %>
                            <tr>
                                <td><%= rs.getString("name") %></td>
                                <td><%= rs.getInt("age") %></td>
                                <td><%= rs.getDate("dob") %></td>
                                <td><%= rs.getString("sex") %></td>
                                <td><%= rs.getString("department") %></td>
                                <td><%= rs.getString("phone") %></td>
                            </tr>
                            <%
                        }
                        con.close();
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                %>
            </table>
        </div>
    </div>
</body>
</html>