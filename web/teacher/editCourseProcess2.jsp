
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
    String courseid = request.getParameter("courseid");
      String coursename = request.getParameter("coursename");
        String lecturer = request.getParameter("lecturer");
          String credit = request.getParameter("credit");
         
    Class.forName("com.mysql.jdbc.Driver");
    java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/courseregistration", "root", "admin");
    Statement st = con.createStatement();
    int rs = st.executeUpdate("update course set  coursename='" + coursename + "', lecturer='" + lecturer + "', credit='" + credit + "', lecid='" + lecid + "'where"
            + "                    courseid='" + courseid + "'");
    
     response.sendRedirect("editCourse2.jsp?lecid="+lecid); 
    
        


%>