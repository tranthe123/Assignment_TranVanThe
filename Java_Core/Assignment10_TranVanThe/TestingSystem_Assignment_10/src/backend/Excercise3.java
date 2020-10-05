/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package backend;

import java.io.IOException;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;

/**
 *
 * @author heohu
 */
public class Excercise3 {
    private JdbcUtils jdbcUtils;

	private MessageProperties messagePoperties;

	private Excercise2 departmentDao;

	public Excercise3() throws ClassNotFoundException, IOException, SQLException {
		jdbcUtils = new JdbcUtils();

		messagePoperties = new MessageProperties();

		departmentDao = new Excercise2();
	}

	// Call Procedure
	public void deleteDepartmentUsingProcedure(int id) throws Exception {
		// check department id exist
//		if (!departmentDao.isDepartmentIdExists(id)) {
//			throw new Exception(messagePoperties.getProperty("department.getDepartmentByID.cannotFindDepartmentById") + id);
//		}

		// if department id not exist delete

		// get connection
		Connection connection = jdbcUtils.connect();

		// Create a statement object
		String sql = "{CALL sp_delete_department(?)}";
		CallableStatement callabeStatement = connection.prepareCall(sql);

		// set parameter
		callabeStatement.setInt(1, id);

		// execute query
		callabeStatement.executeUpdate();

		// disconnect
		jdbcUtils.disconnect();
	}
}
