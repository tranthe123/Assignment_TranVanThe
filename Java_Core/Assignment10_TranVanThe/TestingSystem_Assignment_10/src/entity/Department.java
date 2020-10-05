/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package entity;

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
		return "Department{" + "id=" + departmentID + ", name='" + departmentName + '\'' + '}';
	}


    
}
