/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package backend;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 *
 * @author heohu
 */
public class Excercise4 {
    private JdbcUtils jdbcUtils;

	public Excercise4() throws ClassNotFoundException, IOException, SQLException {
		jdbcUtils = new JdbcUtils();
	}

	// Transaction
	public void deleteDepartmentUsingTransaction(int idDepartment) throws Exception {
		Connection connection = jdbcUtils.connect();
		connection.setAutoCommit(false);
		// xoa nhan vien
		String sql1 = "	DELETE FROM `Account` WHERE DepartmentID = ?";
		PreparedStatement preparedStatement1 = connection.prepareStatement(sql1);
		preparedStatement1.setInt(1, idDepartment);
		// xoa phong ban
		String sql2 = "	DELETE FROM Department WHERE DepartmentID = ?";
		PreparedStatement preparedStatement2 = connection.prepareStatement(sql2);
		preparedStatement2.setInt(1, idDepartment);
		try {
			preparedStatement1.executeUpdate();
			System.out.println("Xoa nhan vien thanh cong!");
			preparedStatement2.executeUpdate();
			System.out.println("Xoa phong ban thanh cong!");
			// commit transaction
			connection.commit();
			System.out.println("Transaction Commit!");
		} catch (Exception e) {
			System.out.println(e.getMessage());
			connection.rollback();
			System.out.println("Transaction Rollback!");
		}
		connection.setAutoCommit(true);
		jdbcUtils.disconnect();
	}
}
