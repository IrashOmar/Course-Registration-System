
<%@page import="crs.courseDAO"%>
<jsp:useBean id="u" class="crs.course"></jsp:useBean>
<jsp:setProperty property="*" name="u"/>
 
<%
int i=courseDAO.update(u);
response.sendRedirect("editCourse.jsp");
%>