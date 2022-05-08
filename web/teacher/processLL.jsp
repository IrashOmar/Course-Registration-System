<%-- 
    Document   : processLU
    Created on : 7 May 2021, 12:34:32 am
    Author     : user
--%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<%@page import="java.io.IOException"%>
<%@page import="crs.lecturer"%>
<%@page import="crs.lecturerDAO"%>
<%@page import="java.io.IOException"%>
<%@page import="crs.lecturer"%>
<%@page import="crs.lecturerDAO"%> 

<%
        
   String lecid = request.getParameter("lecid");
    session.putValue("lecid", lecid);
    String password = request.getParameter("password");
    Class.forName("com.mysql.jdbc.Driver");
    java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/courseregistration", "root", "admin");
    Statement st = con.createStatement();
    ResultSet rs = st.executeQuery("select COUNT(*) from lecturer where lecid='" + lecid + "' and password='" + password + "'");
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
      response.sendRedirect("home.jsp?lecid="+lecid);    
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
