<%-- 
    Document   : edit
    Created on : May 31, 2021, 11:43:12 PM
    Author     : User
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>


<!DOCTYPE html>
<html>

    <head>

        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">

        <title>Course Management System</title>
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

        <!-- Bootstrap CSS CDN -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
        <!-- <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous"> -->
        <!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"> -->
        <!-- Our Custom CSS -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js" integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf" crossorigin="anonymous"></script>

        <link rel="stylesheet" href="admon.css">

        <!-- Font Awesome JS -->
        <!-- <script src="https://kit.fontawesome.com/1f0cb49d65.js" crossorigin="anonymous"></script> -->
        <script defer src="https://use.fontawesome.com/releases/v5.0.13/js/solid.js" integrity="sha384-tzzSw1/Vo+0N5UhStP3bvwWPq+uvzCMfrN1fEFe+xBmv1C/AtVX5K0uZtmcHitFZ" crossorigin="anonymous"></script>
        <script defer src="https://use.fontawesome.com/releases/v5.0.13/js/fontawesome.js" integrity="sha384-6OIrr52G08NpOFSZdxxz1xdNSndlD4vdcf/q2myIUVO0VsqaGHJsB0RaBE01VTOY" crossorigin="anonymous"></script>


        <%@page import="crs.courseDAO2,crs.course2,java.util.*"%>  
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  

        <%
            List<course2> list = courseDAO2.getAllRecords();
            request.setAttribute("list", list);
        %>  
    </head>

    <body>

               <%
                String userid = request.getParameter("lecid");
            %>

        <div class="wrapper">
            <!-- Sidebar Holder -->

            <nav id="sidebar">
                <div class="sidebar-header">
                   
                </div>

                <ul class="list-unstyled components">
                    <li >
                        <a href="home.jsp?lecid=<%=userid%>" class="text">
                            <i class="fas fa-edit"></i>&nbsp&nbspInsert New Courses</a>
                    </li>

                    <li>
                      <li class="active">
                        <a href="editCourse2.jsp?lecid=<%=userid%>">
                            <i class="fas fa-edit"></i>&nbsp&nbspView Courses</a>
                    </li>
                       <li>
                        <a href="../index.jsp"><i class="fa fa-sign-out-alt"></i>&nbsp&nbspLogout</a>
                    </li>
                </ul>
            </nav>
            <!-- Page Content Holder -->
            <div id="content">

                <nav class="navbar navbar-expand-lg navbar-light bg-light">
                    <div class="container-fluid">
                        <button type="button" id="sidebarCollapse" class="navbar-btn">
                            <i class="fas fa-times-circle"></i>
                        </button>
                        <h4 class="align-items-center">Course Management</h4>
                    </div>
                </nav>



                <div class="container">
                    <div class="mb-4">

                    </div>
                    <div class="table-responsive mb-4 ">
                        <table class="table table-striped table-hover table-bordered ">
                            <thead class="table-dark">

                                <tr class="">
                                    <th>Course ID</th>
                                    <th>Course Name</th>
                                    <th>Lecturer</th>
                                    <th>Credit Hours</th>       
                                    <th>Action</th>
                                    <th></th>
                                </tr>

                            </thead>
                            <tbody>
                     <%
                        String lecid=request.getParameter("lecid");
                        
                        String host = "jdbc:mysql://localhost:3306/courseregistration";
                        Connection conn = null;
                        Statement stat = null;
                        ResultSet res = null;
                        Class.forName("com.mysql.jdbc.Driver");
                        conn = DriverManager.getConnection(host,"root","admin");
                        stat = conn.createStatement();
                        String data = "select * from course where lecid='" + lecid + "'";
                        res = stat.executeQuery(data);
                        String courseid="";
                        while(res.next()){
                            
                            courseid=res.getString("courseid");
                  
                   %>

                                  
                                
                                    <tr>
                                        <td><%=courseid%></td>
                                        <td><%=res.getString("coursename")%></td>
                                        <td><%=res.getString("lecturer") %></td>  
                                        <td><%=res.getString("credit") %></td>             
                                        <td><a href="editCourseForm2.jsp?courseid=<%=courseid%>&lecid=<%=lecid%>" class="btn btn-warning" >Edit</a></td>  
                                        <td><a href="deleteCourse2.jsp?courseid=<%=courseid%>&lecid=<%=lecid%>" class="btn btn-danger">Delete</a></td>                       
                                    </tr>
                                    
                                <%
                                    }
                                 %>
             

                            </tbody>
                        </table>

                    </div>

                </div>
            </div>




        </div>


    </body>

</html>
