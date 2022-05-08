<%@page import="crs.courseDAO2"%>
<jsp:useBean id="u" class="crs.course2"></jsp:useBean>
<jsp:setProperty property="*" name="u"/>
 
<%
//stockDAO.delete(u);
//response.sendRedirect("manageStock.jsp");
%>

<%-- 
    Document   : processDA
    Created on : Jun 4, 2021, 1:18:40 AM
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
    String courseid = request.getParameter("courseid");
      String coursename = request.getParameter("coursename");
        String lecturer = request.getParameter("lecturer");
          String credit = request.getParameter("credit");
         
    Class.forName("com.mysql.jdbc.Driver");
    java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/courseregistration", "root", "admin");
    Statement st = con.createStatement();
    int rs = st.executeUpdate("delete from course  where courseid='" + courseid + "'");
    
     response.sendRedirect("editCourse2.jsp?lecid="+lecid); 
    
        


%>
        
  
