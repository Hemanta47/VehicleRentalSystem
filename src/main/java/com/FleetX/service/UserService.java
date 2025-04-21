package com.FleetX.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import com.FleetX.config.DbConfig;
import com.FleetX.model.UserModel;
import com.FleetX.util.PasswordUtil;

public class UserService {
    private Connection dbConnection;

    public UserService() {
        try {
            this.dbConnection = DbConfig.getDbConnection();
        } catch (SQLException | ClassNotFoundException ex) {
            System.err.println("Database Connection error: " + ex.getMessage());
            ex.printStackTrace();
        }
    }

    public UserModel getUserByUsername(String username) {
        UserModel user = null;
        String sqlString = "SELECT * FROM users WHERE Username = ?";

        try (PreparedStatement pst = dbConnection.prepareStatement(sqlString)) {
            pst.setString(1, username);
            ResultSet rSet = pst.executeQuery();

            if (rSet.next()) {
                user = new UserModel();
                user.setFname(rSet.getString("FirstName"));
                user.setLname(rSet.getString("LastName"));
                user.setuName(rSet.getString("UserName"));
                user.setDob(rSet.getDate("DOB").toString()); 
                user.setPhone(rSet.getString("Number"));
                user.setEmail(rSet.getString("Email"));
                user.setPassword(PasswordUtil.decrypt(rSet.getString("Password"), username) );
            }
        } catch (SQLException e) {
            System.err.println("Error fetching user: " + e.getMessage());
        }

        return user;
    }
    
    public boolean updateUserProfile(UserModel user) {
        String sql = "UPDATE users SET FirstName=?, LastName=?, DOB=?, Number=?, Password=?, Email=?, role=? WHERE UserName=?";
        
        try (PreparedStatement pst = dbConnection.prepareStatement(sql)) {
            pst.setString(1, user.getFname());
            pst.setString(2, user.getLname());
            pst.setString(3, user.getDob());
            pst.setString(4, user.getPhone());
            pst.setString(5, user.getPassword());
            pst.setString(6, user.getEmail());
            pst.setString(7, user.getRole());
            pst.setString(8, user.getuName()); // WHERE clause here

            int rows = pst.executeUpdate();
            return rows > 0;
        } catch (Exception e) {
            System.err.println("Error updating profile: " + e.getMessage());
            return false;
        }
    }

}
