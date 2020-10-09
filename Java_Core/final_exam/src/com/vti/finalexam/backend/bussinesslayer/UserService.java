package com.vti.finalexam.backend.bussinesslayer;

import java.sql.SQLException;

import com.vti.finalexam.backend.datalayer.IUserReponsitory;
import com.vti.finalexam.backend.datalayer.UserReponsitory;
import com.vti.finalexam.entity.Project;
import com.vti.finalexam.utils.ScannerUtils;

public class UserService implements IUserService {
	private IUserReponsitory userReponsitory;

	public UserService() {
		userReponsitory = new UserReponsitory();
	}

	private boolean chuanHoaEmail(String email) {
		String EMAIL_REGEX = "^[\\w-_\\.+]*[\\w-_\\.]\\@([\\w]+\\.)+[\\w]+[\\w]$";
		String email1 = email;
		Boolean check = email1.matches(EMAIL_REGEX);
		return check;
	}

	private boolean checkPassword(String pass) {
		boolean check = false;
		boolean check2 = false;

		for (int i = 0; i < pass.length(); i++) {
			if (Character.isUpperCase(pass.charAt(i)))
				check = true;
		}

		if (pass.length() > 5 && pass.length() < 13 && check == true) {
			check2 = true;
		}

		return check2;
	}

	@Override
	public void nhapTenProject(int projectID, int teamSize, int idManager, int idEmployees, int expInYear)
			throws SQLException {
		boolean check = false;
		int projectID1 = projectID;
		int teamSize1 = teamSize;
		int idManager1 = idManager;
		int idEmployees1 = idEmployees;
		int expInYear1 = expInYear;

	}

	@Override
	public boolean isUserExists(String email, String pass) throws SQLException {
		String email1 = email;
		String pass1 = pass;
		boolean check = false;

		while (!check) {
			if (chuanHoaEmail(email1)) {
				check = true;
			} else {
				System.out.println("Email nhap chua dung dinh dang. Nhap lai!");
				email1 = ScannerUtils.inputString("Vui long nhap!");
			}
		}
		check = false;
		while (!check) {
			if (checkPassword(pass1)) {
				check = true;
			} else {
				System.out.println("Pass nhập từ 6 tới 12 ký tự, có ít nhất 1 ký tự viết hoa. Nhap lai!");
				pass1 = ScannerUtils.inputString("Vui long nhap!");
			}
		}

		return userReponsitory.isUserExists(email1, pass1);
	}

	@Override
	public void inRaEmployee(int id, String fullName, String email, String password, Project projectId,
			String proSkill) {
		boolean check = false;
		int id1 = id;
		String fullName1 = fullName;
		String email1 = email;
		String password1 = password;
		Project projectId1 = projectId;
		String proSkill1 = proSkill;

		check = false;
		while (!check) {
			if (chuanHoaEmail(email1)) {
				check = true;
			} else {
				System.out.println("Email nhap chua dung dinh dang. Nhap lai!");
				email1 = ScannerUtils.inputString("Vui long nhap!");
			}
		}
		check = false;
		while (!check) {
			if (checkPassword(password1)) {
				check = true;
			} else {
				System.out.println("Pass nhập từ 6 tới 12 ký tự, có ít nhất 1 ký tự viết hoa. Nhap lai!");
				password1 = ScannerUtils.inputString("Vui long nhap!");
			}
		}

		userReponsitory.inRaEmployee(id, fullName, email, password, projectId, proSkill);

	}

	@Override
	public void inRaManager(int id, String fullName, String email, String password, int exInYear) {
		boolean check = false;
		int id1 = id;
		String fullName1 = fullName;
		String email1 = email;
		String password1 = password;
		int exInYear1 = exInYear;

		check = false;
		while (!check) {
			if (chuanHoaEmail(email1)) {
				check = true;
			} else {
				System.out.println("Email nhap chua dung dinh dang. Nhap lai!");
				email1 = ScannerUtils.inputString("Vui long nhap!");
			}
		}
		check = false;
		while (!check) {
			if (checkPassword(password1)) {
				check = true;
			} else {
				System.out.println("Pass nhập từ 6 tới 12 ký tự, có ít nhất 1 ký tự viết hoa. Nhap lai!");
				password1 = ScannerUtils.inputString("Vui long nhap!");
			}
		}

		userReponsitory.inRaManager(id, fullName, email, password, exInYear);

	}

}
