<%@page import="crs.courseDAO"%>
<jsp:useBean id="u" class="crs.course"></jsp:useBean>
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

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*, crs.DBConnection, crs.courseDAO"%>
<%@page import="crs.course"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>DELETE STOCK</title>
    </head>
    <body>
        <%
            String courseid = request.getParameter("id");
            DBConnection database = new DBConnection();
            courseDAO lDao = new courseDAO();
            int result = lDao.delete(courseid);
            
            if (result > 0){
                out.println("<script type=\"text/javascript\">");
                out.println("alert(\"Success Delete the Record\")");
                out.println("</script >");
                RequestDispatcher rd = request.getRequestDispatcher("editCourse.jsp");
                rd.include(request,response);
            }
            database.closeConnection();
        %>
        
    </body>
</html>
