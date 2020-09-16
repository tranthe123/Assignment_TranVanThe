/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package testingsystem_assignment_2;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

/**
 *
 * @author heohu
 */
public class systemOutPrintf {
	public static void main(String[] args) {

		// Create group
		Group group1 = new Group();
		group1.id = 1;
		group1.name = "Java Fresher";
		group1.createDate = new Date();

		Group group2 = new Group();
		group2.id = 2;
		group2.name = "DB Fresher";
		group2.createDate = new Date();

		Group group3 = new Group();
		group3.id = 3;
		group3.name = "C++ Fresher";
		group3.createDate = new Date();

		// Create Deparment
		Department department1 = new Department();
		department1.id = 1;
		department1.name = "Sale";

		Department department2 = new Department();
		department2.id = 2;
		department2.name = "Bao ve";

		Department department3 = new Department();
		department3.id = 3;
		department3.name = "Giam doc";

		// Create Position
		Position position1 = new Position();
		position1.id = 1;
		position1.name = "Sale1";

		Position position2 = new Position();
		position2.id = 2;
		position2.name = "Sale2";

		Position position3 = new Position();
		position3.id = 3;
		position3.name = "Sale3";

		// Create account
		Account account1 = new Account();
		account1.id = 1;
		account1.createDate = new Date();
		account1.department = department1;
		account1.email = "vanthe@gamil.com";
		account1.fullname = "Tran Van The";
		account1.position = position1;
		account1.username = "VanThe";

		Account account2 = new Account();
		account2.id = 2;
		account2.createDate = new Date();
		account2.department = department1;
		account2.email = "linhanh@gmail.com";
		account2.fullname = "Tran Linh Anh";
		account2.position = position3;
		account2.username = "LinhAnh";

		Account account3 = new Account();
		account3.id = 3;
		account3.createDate = new Date();
		account3.department = department2;
		account3.email = "manhtuyen@gmail.com";
		account3.fullname = "Nguyen Manh Tuyen";
		account3.position = position1;
		account3.username = "ManhTuyen";

		// Add account to group
		Account[] accountOfGroups1 = { account1, account2, account3 };
		group1.accounts = accountOfGroups1;

		// Question 1:
		int a = 5;
		System.out.printf("%d%n", a);

		//Question 2:
		int b = 100000000;
		System.out.printf(Locale.US, "%,d%n", b);

		// Question 3:
		float c = 5.567098f;
		System.out.printf("%5.4f%n", c);

		//Question 4:
		String str = "Nguyen Van A";
		System.out.printf("Tên tôi là \"" + str + "\" và tôi đang độc thân \n");

		// Question 5:
		String pattern = "dd/MM/yyyy HH:mm:ss";
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat(pattern);
		String date = simpleDateFormat.format(new Date());
		System.out.println(date);

		// Question 6:
		Account[] accounts = { account1, account2, account3 };
		for (Account account : accounts) {
			System.out.println("Email: " + account.email);
			System.out.println("FullName: " + account.fullname);
			System.out.println("Name Department: " + account.department.name);
		}

	}

}


