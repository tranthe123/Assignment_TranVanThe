package com.vti.finalexam.frontend;

import java.sql.SQLException;

import com.vti.finalexam.backend.presentationlayer.UserController;
import com.vti.finalexam.utils.ScannerUtils;

public class Program {
	private static UserController userController;

	public static void main(String[] args) throws SQLException {

		userController = new UserController();

		int chon;
		do {
			System.out.println("\n*******************************************");
			System.out.println("**             Users system              **");
			System.out.println("*******************************************");
			System.out.println("**                                       **");
			System.out.println("**        1. Đăng nhập                   **");
			System.out.println("**        0. Thoát chương trình          **");
			System.out.println("**                                       **");
			System.out.println("*******************************************");
			System.out.println("**     Nhập lựa chọn của bạn             **");
			chon = ScannerUtils.inputInt("Vui lòng nhập vào một số. Nhập lại!");
			switch (chon) {
			case 1:
				dangNhap();
				break;
			case 0:
				System.out.println("Đã thoát chương trình thành công!");
				break;
			default:
				System.err.println("Không có lựa chọn này. Nhập lại !");
				break;
			}
		} while (chon != 0);
	}
	private static void dangNhap() throws SQLException{
		System.out.println("Nhap Email:");
		String email = ScannerUtils.inputString("Nhap lai!");
		System.out.println("Nhap pass word:");
		String pass = ScannerUtils.inputString("Nhap lai!");
		if(userController.isUserExists(email, pass))
			System.out.println("Đăng nhập thành công!");
		else
			System.out.println("Email hoặc password không đúng. Kiểm tra lại!");
	}
	
	
	
	private static void nhapProject() throws SQLException {
		System.out.println("Nhap projectID:");
		int projectId = ScannerUtils.inputInt("Nhap lai!");
		System.out.println("Nhap teamSize:");
		int teamSize = ScannerUtils.inputInt("Nhap lai!");
		System.out.println("Nhap idManager:");
		int idManager = ScannerUtils.inputInt("Nhap lai!");
		System.out.println("Nhap idEmployees:");
		int idEmployees = ScannerUtils.inputInt("Nhap lai!");
		userController.nhapTenProject(projectId, teamSize, idManager, idEmployees);;
	}
	

	}

