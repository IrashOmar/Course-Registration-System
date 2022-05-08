/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package crs;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class lecturerDAO {

    private final Connection connection;
    private int result;

    public lecturerDAO() {
        connection = DBConnection.getConnection();

    }

    public static lecturer signinlecturer(int lecid, String password) {
       lecturer lecturer = null;
        try {
            Connection con = DBConnection.getConnection();
            PreparedStatement ps = con.prepareStatement("select * from lecturer where lecid=? and password=?");
            
            ps.setInt(1, lecid);
            ps.setString(2, password);
            
            ResultSet result = ps.executeQuery();
            
            if (result.next()) {
            
                lecturer=new lecturer();
                lecturer.setLecid(result.getInt("lecid"));
                lecturer.setLecname(result.getString("lecname"));
                lecturer.setFaculty(result.getString("faculty"));
                lecturer.setPassword(result.getString("password"));

            }
            con.close();

        } catch (SQLException ex) {
        }
        return lecturer;
    }


}
