package testingsystem_assignment_10.frontend;

import java.io.IOException;
import java.sql.SQLException;

import testingsystem_assignment_10.backend.Basic;
import testingsystem_assignment_10.ultis.ScannerUtils;

/**
 *
 * @author heohu
 */
public class BasicProgram {

	public static void main(String[] args) throws ClassNotFoundException, SQLException, IOException {

		Basic program = new Basic();

		// Question 1:
		program.connect();

		// Question 2:
		program.readDataPosition();

		// Question 3:
		System.out.println("Input name: ");
		String name = ScannerUtils.inputName();
		program.createPosition(name);

		// Question 4:
		program.updatePositionName();

		// Question 5:
		System.out.println("Input id: ");
		int id = ScannerUtils.inputId();
		program.deleteDepartmentByID(id);

		// Close connection
		program.closeConnection();
	}

}
