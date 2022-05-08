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

        <title>Edit Product</title>
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
        <style>
            .invoice-box {
                max-width: 800px;
                margin: auto;
                padding: 20px;
                border: 1px solid #eee;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.15);
                font-size: 16px;
                line-height: 18px;
                font-family: "Helvetica Neue", "Helvetica", Helvetica, Arial, sans-serif;
                color: #555;
            }
            .invoice-box table {
                width: 100%;
                line-height: inherit;
                text-align: left;
            }

            .invoice-box table td {
                padding: 5px;
                vertical-align: top;
            }

            .invoice-box table tr td:nth-child(2) {
                text-align: right;
            }

            .invoice-box table tr.top table td {
                padding-bottom: 10px;
            }

            .invoice-box table tr.top table td.title {
                font-size: 15px;
                line-height: 30px;
                color: #333;
            }

            .invoice-box table tr.information table td {
                padding-bottom: 20px;
            }

            .invoice-box table tr.heading td {
                background: #eee;
                border-bottom: 1px solid #ddd;
                font-weight: bold;
                text-align: center;
                
                
            }

            .invoice-box table tr.details td {
                padding-bottom: 20px;
                text-align: center;
                
            }

            .invoice-box table tr.item td {
                border-bottom: 1px solid #eee;
            }

            .invoice-box table tr.item.last td {
                border-bottom: none;
            }

            .invoice-box table tr.total td:nth-child(2) {
                border-top: 2px solid #eee;
                font-weight: bold;
            }

            @media only screen and (max-width: 600px) {
                .invoice-box table tr.top table td {
                    width: 100%;
                    display: block;
                    text-align: center;
                }

                .invoice-box table tr.information table td {
                    width: 100%;
                    display: block;
                    text-align: center;
                }
                @media print {
                    .noPrint{
                        display:none;
                    }
                }
              

            }
            button{
                margin-left:800px;
            }
        </style>
    </head>

    <body>



        <div class="wrapper">
            <!-- Sidebar Holder -->

            <nav id="sidebar">
                <div class="sidebar-header">
                    <img src="../img/HajahRosnani_Logo.png" alt="logo" width="150" class="mx-2">
                </div>

                <ul class="list-unstyled components">
                    <li>
                        <a href="editCourse.jsp" class="text">
                            <i class="fas fa-book"></i>&nbsp&nbspCourse Details</a>
                    </li>

                    <li class="active">
                        <a href="Print.jsp">
                            <i class="fas fa-print"></i>&nbsp&nbspPrint Details</a>
                    </li>

                    <li>
                        <a href="index.jsp"><i class="fa fa-sign-out-alt"></i>&nbsp&nbspLogout</a>
                    </li>

                </ul>

            </nav>

            <!-- Page Content Holder -->
            <div id="content">

                <nav class="navbar navbar-expand-lg navbar-light bg-light">
                    <div class="container-fluid">
                        <button type="button" id="sidebarCollapse" class="navbar-btn">

                        </button>

                        <h4 class="align-items-center">Register Course</h4>
                    </div>
                </nav>



                <div class="container">


                    <div class="invoice-box">
   
                        <table cellpadding="0" cellspacing="0">
                            <tr class="top">
                                <td colspan="2">
                                    <table>
                                        <tr>
                                            <td class="title">
                                                <b> Student ID : </b>
                                                <br /> <br />
                                                <b> Student Name: </b>
                                                <br /><br />



                                            </td>
                                            <td>

                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                 

                            <tr class="heading">
                                <td>
                                    Course Details
                                </td>
                                <td></td>
                                <td></td>
                                <td></td>
                            </tr>
                         <%
                        
                        String host = "jdbc:mysql://localhost:3306/courseregistration";
                        Connection conn = null;
                        Statement stat = null;
                        ResultSet res = null;
                        Class.forName("com.mysql.jdbc.Driver");
                        conn = DriverManager.getConnection(host,"root","admin");
                        stat = conn.createStatement();
                        String data = "select * from course2 order by courseid desc";
                        res = stat.executeQuery(data);
                        while(res.next()){
                            
                  
                   %>

                            <tr class="details">
                                <td>
                                  <%=res.getString("courseid") %>
                                </td>
                                <td>
                                    <%=res.getString("coursename")%>
                                </td>
                                   <td>
                                    <%=res.getString("lecturer")%>
                                </td>
                                   <td>
                                    <%=res.getString("credit")%>
                                </td>
                            </tr>

                                     <%
                                    }
                                 %>

                            <tr class="heading">
                                <td>
                                    Other Details
                                </td>
                                  <td></td>
                                <td></td>
                                 <td></td>
                            </tr>

                            <tr class="item">
                                <td>
                                    Session
                                </td>

                                <td>

                                </td>
                            </tr>

                            <tr class="item">
                                <td>
                                    Department
                                </td>

                                <td>

                                </td>
                            </tr>


                            <tr class="item last">
                                <td>
                                    Semester
                                </td>

                                <td>

                                </td>
                            </tr>
                        </table>



                    </div>
                    <br>
                    
                        <button onclick="window.print();" class="noPrint">
                            Save
                        </button>      
                   
                </div>

            </div>
        </div>




   


</body>

</html>
