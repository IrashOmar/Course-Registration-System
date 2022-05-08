/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package crs;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import crs.CourseServlet;
import crs.DBConnection;
import java.sql.SQLException;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.annotation.WebServlet;

/**
 *
 */
@WebServlet("/")
public class CourseServlet extends HttpServlet {
    private courseDAO3 courseDAO3;
    
    public void init(){
        courseDAO3 =new courseDAO3();
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request,response);
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action=request.getServletPath();
        try{
            switch(action){
                case"/new": showNewCourse(request,response);
                break;
                case"/insert": insertCourse(request,response);
                break;
                case"/delete": deleteCourse(request,response);
                break;
                case"/edit": showEditForm(request,response);
                break;
                case"/update": updateCourse(request,response);
                break;
                default:listCourse(request,response);
                break;
            }
        }catch(SQLException ex){
            throw new ServletException(ex);
        }
    }

    private void listCourse(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, ServletException, IOException {
        boolean listCourse = courseDAO3.equals("courseid");
        request.setAttribute("listCourse", listCourse);
        RequestDispatcher dispatcher = request.getRequestDispatcher("editCourse.jsp");
        dispatcher.forward(request, response);
    }
    
    private void showNewCourse(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("editCourse.jsp");
        dispatcher.forward(request, response);
    }
    
    private void showEditForm(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, ServletException, IOException {
       String id = request.getParameter("courseid");
        RequestDispatcher dispatcher = request.getRequestDispatcher("editCourse.jsp");
        Object existingCourse = null;
        request.setAttribute("course", existingCourse);
        dispatcher.forward(request, response);
    }
    
    private void insertCourse(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        String courseid = request.getParameter("courseid");
        String coursename = request.getParameter("coursename");
        String lecturer = request.getParameter("lecturer");
          course course = new course(courseid, coursename, lecturer);
        courseDAO3.insertCourse(courseid);
        response.sendRedirect("list");
    }
    
    private void updateCourse(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
         String courseid = request.getParameter("courseid");
           String coursename = request.getParameter("coursename");
        String lecturer = request.getParameter("lecturer");
        course course = new course(courseid, coursename, lecturer);
        courseDAO3.updateCourse(courseid);
        response.sendRedirect("list");
    }
    
    private void deleteCourse(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        courseDAO3.deleteCourse(id);
        response.sendRedirect("list");
    }

    
}
