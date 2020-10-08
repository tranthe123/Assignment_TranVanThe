package testingsystem_assignment_10.frontend;

import testingsystem_assignment_10.backend.CallProcedure;
import testingsystem_assignment_10.ultis.ScannerUtils;

/**
 *
 * @author heohu
 */
public class CallProcedureProgram {

	public static void main(String[] args) throws Exception {
		
	}

	public static void question1() throws Exception {
		System.out.println("Input department id: ");
		int id = ScannerUtils.inputId();

		new CallProcedure().deleteDepartmentUsingProcedure(id);
		System.out.println("Delete Success!");
	}
}
