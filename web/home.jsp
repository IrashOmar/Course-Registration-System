<%-- 
    Document   : processLogin
    Created on : Jun 18, 2021, 10:45:07 AM
    Author     : user
--%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<%@page import="java.io.IOException"%>
<%@page import="crs.lecturer"%>
<%@page import="crs.lecturerDAO"%>
<%
    String userid = request.getParameter("userid");
    session.putValue("userid", userid);
    String password = request.getParameter("password");
    Class.forName("com.mysql.jdbc.Driver");
    java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/courseregistration", "root", "admin");
    Statement st = con.createStatement();
    ResultSet rs = st.executeQuery("select COUNT(*) from student where userid='" + userid + "' and password='" + password + "'");
     String Countrow="";
    try {
        
          while(rs.next()){
          Countrow = rs.getString(1);
       
       }
//        rs.next();
//        if (rs.getString("password").equals("SA123") && rs.getString("userid").equals("S44231")) {
//            out.println("Welcome " + userid);
//            response.sendRedirect("editCourse.jsp");
//        } else if (rs.getString("password").equals("KH007") && rs.getString("userid").equals("B1233")) {
//            out.println("Welcome " + userid);
//            response.sendRedirect("editCourse2.jsp");
//        } else {
//             
//            response.sendRedirect("editCourse2.jsp");
//                
//        }

      if(Countrow.equals ("1")) {
      response.sendRedirect("editCourse2.jsp?userid="+userid);    
      }
      else{
      
     out.println("<script type=\"text/javascript\">");
                out.println("alert(\"Log in Unccessfull!!!\")");
                out.println("window.open('login.jsp','_self')");
                out.println("</script >");;
                
      }
    } catch (Exception e) {
        e.printStackTrace();
    }
%>
