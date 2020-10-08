package testingsystem_assignment_10.entity;

/**
 *
 * @author heohu
 */
public class Department {

	private int departmentID;
	private String departmentName;

	public int getDepartmentID() {
		return departmentID;
	}

	public void setDepartmentID(int DepartmentID) {
		this.departmentID = DepartmentID;
	}

	public String getDepartmentName() {
		return departmentName;
	}

	public void setDepartmentName(String name) {
		this.departmentName = name;
	}

	@Override
	public String toString() {
		String result = "Department{" + "id=" + departmentID + ", name='" + departmentName + '\'' + '}';
                        returen result;
	}


	}

