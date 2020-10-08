package testingsystem_assignment_10.frontend;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import testingsystem_assignment_10.backend.DepartmentDao;
import testingsystem_assignment_10.entity.Department;
import testingsystem_assignment_10.ultis.ScannerUtils;

/**
 *
 * @author heohu
 */
public class CRUDProgram {

	public static void main(String[] args) throws Exception {

	private static void question1() throws SQLException, IOException, ClassNotFoundException {
		List<Department> departments = new DepartmentDao().getDepartments();

		for (Department department : departments) {
			System.out.println(department);
		}
	}

	public static void question23() throws Exception {
		System.out.println("Input department id: ");
		int id = ScannerUtils.inputId();

		Department department = new DepartmentDao().getDepartmentByID(id);
		System.out.println(department);
	}

	public static void question4() throws Exception {
		System.out.println("Input department Name: ");
		String name = ScannerUtils.inputName();

		boolean result = new DepartmentDao().isDepartmentNameExists(name);
		System.out.println("Result: " + result);
	}

	public static void question5() throws Exception {
		System.out.println("Input department Name: ");
		String name = ScannerUtils.inputName();

		new DepartmentDao().createDepartment(name);
		System.out.println("create success!");
	}

	public static void question6() throws Exception {
		System.out.println("Input department id: ");
		int id = ScannerUtils.inputId();

		System.out.println("Input department new name: ");
		String newName = ScannerUtils.inputName();

		new DepartmentDao().updateDepartment(id, newName);
		System.out.println("update success!");
	}

	public static void question7() throws Exception {
		System.out.println("Input department id: ");
		int id = ScannerUtils.inputId();

		new DepartmentDao().deleteDepartment(id);
		System.out.println("delete success!");
	}
}
