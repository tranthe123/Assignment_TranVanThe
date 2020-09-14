/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package testingsystemAssignment_1;

import java.time.LocalDate;
import java.util.Date;

/**
 *
 * @author heohu
 */
public class Program {
    public static void main(String[] args) {
		// create department
		Department department1 = new Department();
		department1.departmentID = 1;
		department1.DepartmentName = "Sale";

		Department department2 = new Department();
		department2.departmentID = 2;
		department2.DepartmentName = "Manager";

		// create group
		Group group1 = new Group();
		group1.groupID = 1;
		group1.groupName = "Python";

		Group group2 = new Group();
		group2.groupID = 2;
		group2.groupName = "Java";

		// Create position
		Position position1 = new Position();
		position1.positionID = 1;
		position1.positionName = "Sale";

		Position position2 = new Position();
		position1.positionID = 2;
		position1.positionName = "Manager";

		// Create account
		Account account1 = new Account();
//		account1.id = 1;
		account1.Email = "vanthe@gmail.com";
		account1.accountID = 1;
		account1.fullName = "Tran Van The";
		account1.positionID = 1;
		account1.userName = "vanthe";

		Account account2 = new Account();
//		account2.id = 2;
		account2.Email = "manhtuyen@gmail.com";
		account2.accountID = 2;
		account2.fullName = "Nguyen Manh Tuyen";
		account2.positionID = 2;
		account2.userName  = "manhtuyen";

		// print department
		

		System.out.println("Name is: " + department1.DepartmentName);
		System.out.println("ID is: " + department1.departmentID + "\n");

		System.out.println("Name is: " + department2.DepartmentName);
		System.out.println("ID is: " + department2.departmentID + "\n");
		
		// print account
		

//		System.out.println("id: " + account1.id);
		System.out.println("Email is: " + account1.Email);
		System.out.println("AccountID is: " + account1.accountID);
                System.out.println("FullName is: " + account1.fullName);
                System.out.println("PositionID is: " + account1.positionID);
                System.out.println("UserName is: " + account1.userName);
	}
}
