package com.vti.finalexam.backend.datalayer;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.vti.finalexam.entity.Project;
import com.vti.finalexam.utils.JdbcUtils;

public class UserReponsitory implements IUserReponsitory {

	@Override
	public void nhapTenProject(int projectID, int teamSize, int idManager, int idEmployees, int expInYear)
			throws SQLException {
		Connection con = jdbcUtils.getConnection();
		String query = "insert into `project` (projectID, teamSize, idManage, idEmployees, expInYear) values(?,?,?,?,?)";
		PreparedStatement preparedStatement = con.prepareStatement(query);
		preparedStatement.setInt(1, projectID);
		preparedStatement.setInt(2, teamSize);
		preparedStatement.setInt(3, idManager);
		preparedStatement.setInt(4, idEmployees);
		preparedStatement.setInt(5,  expInYear);

		int row = preparedStatement.executeUpdate();
		if (row == 1)
			System.out.println("Tạo project thành công!");

		jdbcUtils.disconnect();
		
	}

	@Override
	public boolean isUserExists(String email, String pass) throws SQLException {
		Connection con = jdbcUtils.getConnection();
		String query = "select * from `users` where email = ? and pass = ?";
		PreparedStatement preparedStatement = con.prepareStatement(query);
		preparedStatement.setString(1, email);
		preparedStatement.setString(2, pass);

		boolean check = false;
		ResultSet set = preparedStatement.executeQuery();

		if (set.next())
			check = true;

		jdbcUtils.disconnect();
		return check;
	}

	@Override
	public void inRaEmployee(int id, String fullName, String email, String password, Project projectId,
			String proSkill) {
		Connection con = jdbcUtils.getConnection();
		String query = "select * from `Employee` ";
		 Statement statement = connection.createStatement();// tạo statement giúp chạy sql
	             
	 // buoc 4: excuteQuery
	       ResultSet resultSet = statement.executeQuery(query);
	    
	 // buoc 5: xử lý kết quả: handing result
	       while(resultSet.next()){
	    	  
	    	   System.out.println(resultSet.getInt("id"));
	    	   System.out.println(resultSet.getString("fullName"));
	    	   System.out.println(resultSet.getString("email"));
	    	   System.out.println(resultSet.getString("password"));
	    	   System.out.println(resultSet.getString("projectID"));
	    	   System.out.println(resultSet.getString("proSkill"));
		jdbcUtils.disconnect();
		
	}

	@Override
	public void inRaManager(int id, String fullName, String email, String password, int exInYear) {
		Connection con = jdbcUtils.getConnection();
		String query = "select * from `Employee` ";
		 Statement statement = connection.createStatement();// tạo statement giúp chạy sql
	             
	 // buoc 4: excuteQuery
	       ResultSet resultSet = statement.executeQuery(query);
	    
	 // buoc 5: xử lý kết quả: handing result
	       while(resultSet.next()){
	    	  
	    	   System.out.println(resultSet.getInt("id"));
	    	   System.out.println(resultSet.getString("fullName"));
	    	   System.out.println(resultSet.getString("email"));
	    	   System.out.println(resultSet.getString("password"));
	    	   System.out.println(resultSet.getInt("exInYear"));    	   
		
		jdbcUtils.disconnect();
		
	}
	
	
}
