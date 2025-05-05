package com.FleetX.service;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.FleetX.config.DbConfig;
import com.FleetX.model.VehicleModel;

public class VehicleService {
	private Connection dbConnection;

	public VehicleService() {
		try {
			this.dbConnection = DbConfig.getDbConnection();
		} catch (SQLException | ClassNotFoundException ex) {
			System.err.println("Database Connection error: " + ex.getMessage());
			ex.printStackTrace();
		}
	}
	
	/*
	// Get all vehicles
	public List<VehicleModel> getAllVehicles() {
		
		List<VehicleModel> vehicles = new ArrayList<>();
		String sql = "SELECT * FROM vehicle";

		try (PreparedStatement stmt = dbConnection.prepareStatement(sql);
		     ResultSet rs = stmt.executeQuery()) {
			while (rs.next()) {
				vehicles.add(setVehicleResult(rs));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return vehicles;
	} */
	
	//Filtering Vehicle
	public List<VehicleModel> getFilteredVehicles(String fuel, String gear, String type, String location) {
	    List<VehicleModel> vehicles = new ArrayList<>();
	    StringBuilder sql = new StringBuilder("SELECT * FROM vehicle WHERE 1=1");
	    List<Object> params = new ArrayList<>();

	    if (fuel != null && !fuel.isEmpty()) {
	        sql.append(" AND fuel_type = ?");
	        params.add(fuel);
	    }
	    if (gear != null && !gear.isEmpty()) {
	        sql.append(" AND transmission = ?");
	        params.add(gear);
	    }
	    if (type != null && !type.isEmpty()) {
	        sql.append(" AND category = ?");
	        params.add(type);
	    }
	    if (location != null && !location.isEmpty()) {
	        sql.append(" AND location = ?");
	        params.add(location);
	    }

	    try (PreparedStatement stmt = dbConnection.prepareStatement(sql.toString())) {
	        for (int i = 0; i < params.size(); i++) {
	            stmt.setObject(i + 1, params.get(i));
	        }

	        try (ResultSet rs = stmt.executeQuery()) {
	            while (rs.next()) {
	                vehicles.add(setVehicleResult(rs));
	            }
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }

	    return vehicles;
	}

	
	public VehicleModel getVehicleById(int id) {
	    VehicleModel vehicle = null;
	    String sql = "SELECT * FROM vehicle WHERE id = ?";
	    try (PreparedStatement stmt = dbConnection.prepareStatement(sql)) {
	        stmt.setInt(1, id);
	        ResultSet rs = stmt.executeQuery();
	        if (rs.next()) {
	            vehicle = setVehicleResult(rs); // use your helper
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    return vehicle;
	}

	public VehicleModel setVehicleResult(ResultSet rs) throws SQLException {
		VehicleModel v = new VehicleModel();
		v.setId(rs.getInt("id"));
		v.setCategory(rs.getString("category"));
		v.setBrand(rs.getString("brand"));
		v.setModel(rs.getString("model"));
		v.setYear(rs.getInt("year"));
		v.setRegistrationNumber(rs.getString("registration_number"));
		v.setDailyRate(rs.getInt("daily_rate"));
		v.setFuelType(rs.getString("fuel_type"));
		v.setTransmission(rs.getString("transmission"));
		v.setCapacity(rs.getInt("capacity"));
		v.setStatus(rs.getString("status"));
		v.setImageUrl(rs.getString("image_url"));
		v.setLocation(rs.getString("location"));
		v.setDescription(rs.getString("description"));
		v.setFeatures(rs.getString("features"));
		return v;
	}
	
		public List<VehicleModel> getNewAddedVehicle(){
		List<VehicleModel> vehicles = new ArrayList<>();
		String sql = "SELECT * FROM vehicle ORDER BY id DESC LIMIT 4";

		try (PreparedStatement stmt = dbConnection.prepareStatement(sql);
		     ResultSet rs = stmt.executeQuery()) {
			while (rs.next()) {
				vehicles.add(new VehicleModel(
						rs.getInt("id"),
						rs.getString("brand"),
						rs.getString("model"),
						rs.getInt("daily_rate"),
						rs.getString("transmission"),
						rs.getInt("capacity"),
						rs.getString("image_url")
						));
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return vehicles;

	}
}
