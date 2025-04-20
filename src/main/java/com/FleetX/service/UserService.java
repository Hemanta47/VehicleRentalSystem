package com.FleetX.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import com.FleetX.config.DbConfig;
import com.FleetX.model.UserModel;

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
                user.setPassword(rSet.getString("Password"));
            }
        } catch (SQLException e) {
            System.err.println("Error fetching user: " + e.getMessage());
        }

        return user;
    }
}
