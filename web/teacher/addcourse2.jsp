<%@page import="crs.courseDAO2"%>  
<jsp:useBean id="u" class="crs.course2"></jsp:useBean>  
<jsp:setProperty property="*" name="u"/>  

<%
    int i = courseDAO2.save(u);
    if (i > 0) {
        out.println("Registration done successfully...");
        out.println("<script type=\"text/javascript\">");
        out.println("alert(\"Registration Successfully!!!\")");
        out.println("</script >");
        response.sendRedirect("editCourse2.jsp");
    } else {
        out.println("Registration failed...");
        response.sendRedirect("editCourse2.jsp");
    }
%>  