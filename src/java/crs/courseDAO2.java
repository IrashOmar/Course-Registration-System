package crs;
 
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
 
 
public class courseDAO2 {
    
    
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
 
    public static int save(course2 i) {
        int status = 0;
        try {
            Connection con = getConnection();
            PreparedStatement ps = con.prepareStatement("insert into course2(courseid,coursename,lecturer,credit) values(?,?,?,?)");
           
            ps.setString(1, i.getCourseid());
            ps.setString(2, i.getCoursename());
            ps.setString(3, i.getLecturer());   
            ps.setInt(4,  i.getCredit());
            status = ps.executeUpdate();
            
        } catch (Exception e) {
            System.out.println(e);
        }
        return status;
    }
 

        
    public static int update(course2 i) {
        int status = 0 ;
        try {
            Connection con = getConnection();
            PreparedStatement ps = con.prepareStatement("update course2 set coursename=?,lecturer=?,credit=? where courseid=?");
           
            ps.setString(1, i.getCoursename());
            ps.setString(2, i.getLecturer());
            ps.setInt(3, i.getCredit());    
            ps.setString(4, i.getCourseid());
          
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
            String mySqlQuery = "delete from course2 where courseid =?";
            PreparedStatement myPs = con.prepareStatement(mySqlQuery);
            myPs.setString(1, courseid);
            status = myPs.executeUpdate();
        } catch (Exception e) {
            System.out.println("Exception is ;" + e);
        }
        return status;
    }
 
    public static List<course2> getAllRecords() {
        List<course2> list = new ArrayList<course2>();
 
        try {
            Connection con = getConnection();
            PreparedStatement ps = con.prepareStatement("select * from course2");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                course2 i = new course2();
                i.setCourseid(rs.getString("courseid"));
                i.setCoursename(rs.getString("coursename"));
                i.setLecturer(rs.getString("lecturer"));
                i.setCredit(rs.getInt("credit"));
                list.add(i);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }
 
    public static course2 getRecordById(String courseid) {
        course2 i = null;
        try {
            Connection con = getConnection();
            PreparedStatement ps = con.prepareStatement("select * from course2 where courseid=?");
            ps.setString(1, courseid);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                i = new course2();
                i.setCourseid(rs.getString("courseid"));
                i.setCoursename(rs.getString("coursename"));
                i.setLecturer(rs.getString("lecturer"));
                i.setCredit(rs.getInt("credit"));
          
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return i;
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
}