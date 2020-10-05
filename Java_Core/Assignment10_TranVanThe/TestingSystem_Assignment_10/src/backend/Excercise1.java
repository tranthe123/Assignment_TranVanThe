/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package backend;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author heohu
 */
public class Excercise1 {
        private Properties properties;
	private Connection connection;

	public Excercise1() throws FileNotFoundException, IOException {
		properties = new Properties();
		properties.load(new FileInputStream("C:\\"));
				
	}

	// Question 1: (Sử dụng Database Testing System đã xây dựng ở SQL)
	// Tạo connection tới database Testing System
	// In ra "Connect success!" khi kết nối thành công.
	public void connect() throws IOException, ClassNotFoundException, SQLException {

		String url = properties.getProperty("url");
		String username = properties.getProperty("user");
		String password1 = properties.getProperty("password");
		
                //
		 String dbUrl = "jdbc:mysql://localhost:3306/TestingSystem";//duong dan toi database
                 String user = "root";
                 String password = "tranvanthe6499";
                 
                 Connection cont = DriverManager.getConnection(dbUrl, user, password);

		System.out.println(properties.getProperty("Connect Success"));
	}

	// Question 2:
	// Tạo method để in ra các thông tin của position gồm có id, name
	public void inTtPosition() throws SQLException, ClassNotFoundException, IOException {
		
		String sql = "SELECT * FROM `Position`";
                Statement statement = connection.createStatement();
                System.out.println(sql);
		ResultSet resultSet = statement.executeQuery(sql);
		while (resultSet.next()) {
			System.out.println(resultSet.getInt("PositionID"));
			System.out.println(resultSet.getString("PositionName"));
		}
	}

	// Question 3:
	// Tạo method để tạo position, user sẽ nhập vào name và id.
	public void taoPosition(String name) throws SQLException {
		// Create a statement object

		String sql = "INSERT INTO `Position` (PositionName) " + "VALUE(?)";
		PreparedStatement statement = connection.prepareStatement(sql);
		statement.setString(1, name);
		int effAmount = statement.executeUpdate();
		// Handing result set
		if (effAmount == 1) {
			System.out.println(properties.getProperty("nhap thanh cong"));
		} else {
			System.out.println(properties.getProperty("nhap that bai"));
		}
	}

	// Question 4:
	// Tạo method để update tên của position gồm có id = 5 thành "Developer".
	public void updatePositionName() throws SQLException {

		Statement statement = connection.createStatement();
		String sql = "UPDATE `Position` SET PositionName = 'Dev' WHERE PositionID = 5";
		int effectedRecordAmount = statement.executeUpdate(sql);
		if (effectedRecordAmount == 1) {
			System.out.println(properties.getProperty("tao thanh cong"));
		} else {
			System.out.println(properties.getProperty("tao that bai"));
		}
	}

	// Question 5:
	// Tạo method để delete của position theo id và user sẽ nhập vào id
	public void deleteDepartmentByID(int id) throws SQLException {

		// Create a statement object
		String sql = " DELETE FROM `Position` WHERE PositionID = ?";
		PreparedStatement statement = connection.prepareStatement(sql);
		statement.setInt(1, id);
		int effAmount = statement.executeUpdate();
		if (effAmount > 0) {
			System.out.println(properties.getProperty("xoa thanh cong"));
		} else {
			System.out.println(properties.getProperty("xoa that bai"));
		}
	}

	public void closeConnection() throws SQLException {
		connection.close();
	}

}
