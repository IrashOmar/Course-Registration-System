package crs;
 
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
 
 
public class courseDAO {
    
    
    public static Connection getConnection() {
        Connection con = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/courseregistration", "root", "admin");
        } catch (Exception e) {
            System.out.println(e);
        }
        return con;
    }
 
    public static int save(course u) {
        int status = 0;
        try {
            Connection con = getConnection();
            PreparedStatement ps = con.prepareStatement("insert into course(courseid,coursename,lecturer,credit) values(?,?,?,?)");
           
            ps.setString(1, u.getCourseid());
            ps.setString(2, u.getCoursename());
            ps.setString(3, u.getLecturer());   
            ps.setInt(4,  u.getCredit());
            status = ps.executeUpdate();
            
        } catch (Exception e) {
            System.out.println(e);
        }
        return status;
    }
 

        
    public static int update(course u) {
        int status = 0 ;
        try {
            Connection con = getConnection();
            PreparedStatement ps = con.prepareStatement("update course set coursename=?,lecturer=?,credit=? where courseid=?");
           
            ps.setString(1, u.getCoursename());
            ps.setString(2, u.getLecturer());
            ps.setInt(3, u.getCredit());    
            ps.setString(4, u.getCourseid());
          
            status = ps.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
        return status;
    }
 
    
   /* public static int delete(stock u) {
        int status = 0;
        try {
            Connection con = getConnection();
            PreparedStatement ps = con.prepareStatement("delete from stock where stoid=?");
            ps.setString(1, u.getStoid());
            status = ps.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
 
        return status;
    }*/
    
    public int delete(String courseid) {
        int status = 0;
        try {
            Connection con = getConnection();
            String mySqlQuery = "delete from course where courseid =?";
            PreparedStatement myPs = con.prepareStatement(mySqlQuery);
            myPs.setString(1, courseid);
            status = myPs.executeUpdate();
        } catch (Exception e) {
            System.out.println("Exception is ;" + e);
        }
        return status;
    }
 
    public static List<course> getAllRecords() {
        List<course> list = new ArrayList<course>();
 
        try {
            Connection con = getConnection();
            PreparedStatement ps = con.prepareStatement("select * from course");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                course u = new course();
                u.setCourseid(rs.getString("courseid"));
                u.setCoursename(rs.getString("coursename"));
                u.setLecturer(rs.getString("lecturer"));
                u.setCredit(rs.getInt("credit"));
                list.add(u);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }
 
    public static course getRecordById(String courseid) {
        course u = null;
        try {
            Connection con = getConnection();
            PreparedStatement ps = con.prepareStatement("select * from course where courseid=?");
            ps.setString(1, courseid);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                u = new course();
                u.setCourseid(rs.getString("courseid"));
                u.setCoursename(rs.getString("coursename"));
                u.setLecturer(rs.getString("lecturer"));
                u.setCredit(rs.getInt("credit"));
          
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return u;
    }
 
    /*public static List<UserBean> getRecords(int start, int total) {
        List<UserBean> list = new ArrayList<UserBean>();
        try {
            Connection con = getConnection();
            PreparedStatement ps = con.prepareStatement(
                    "select * from employees limit " + (start - 1) + "," + total);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                UserBean e = new UserBean();
                e.setId(rs.getInt(1));
                e.setName(rs.getString(2));
                e.setSalary(rs.getFloat(7));
                list.add(e);
            }
            con.close();
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }*/

    void updateEmployee(course employee) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    void updateCourse(String courseid) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    List<course> selectAllCourse() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    course updateCourse() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    void deleteCourse(int id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    void insertCourse(String courseid) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
}