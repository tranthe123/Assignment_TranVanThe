/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package testingsystem_assignment_2;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Scanner;
/**
 *
 * @author heohu
 */
public class inputFromConsole {
 
	public static void main(String[] args) throws ParseException {

		Scanner scanner = new Scanner(System.in);

		// Question 1:
		System.out.println("Nhap vao 3 so nguyen duong ");
		for (int i = 0; i < 3; i++) {
			int x = scanner.nextInt();
			System.out.println("3 so nguyen duong la: " + x + "\n");
		}

		//Question 2:
		System.out.println("Nhap vao 2 so thuc");
		for (int i = 0; i < 2; i++) {
			double d = scanner.nextDouble();
			System.out.println("2 so thuc la: " + d + "\n");
		}

		// Question 3:
		System.out.println("Nhap vao ho: ");
		String sc1 = scanner.next();
		System.out.println("Nhap vao ten: ");
		String sc2 = scanner.next();
		System.out.println("Ho ten la: " + sc1 + " " + sc2 + "\n");

//		// Question 4:
//		System.out.println("Nhap vao ngay sinh");
//		String dateOfBirth = scanner.next();
//		String pattern = "yyyy/MM/dd";
//		SimpleDateFormat dateFormat = new SimpleDateFormat(pattern);
//		Date date = dateFormat.parse(dateOfBirth);
//		System.out.println("Sinh Nhat Cua Ban La : " + date "\n");

		// Question 5:
                
		System.out.print("Nhap vao Account ID:");
		int id = scanner.nextInt();

		scanner.nextLine();
		System.out.print("Nhap vao username:");
		String userName = scanner.nextLine();

		System.out.print("Nhap vao Department:");
		String department = scanner.nextLine();

		System.out.print("Nhap vao Position ID (tu 1 -> 5):");
		int position = scanner.nextInt(6);
		switch (position) {
		case 1:
			System.out.print("Dev");
			break;
		case 2:
			System.out.print("Test");
			break;
		case 3:
			System.out.print("ScrumMaster");
			break;
		case 4:
			System.out.print("PM");
			break;
		default:
			System.out.print("HR");
		}
               

		System.out.print("\nNhap vao group:");
		scanner.nextLine();
		String groups = scanner.nextLine();

		System.out.print("\nNhap vao ngay:");
		String date = scanner.nextLine();
	}

                // Question 6:
	public static void Department() {
		Scanner scanner = new Scanner(System.in);
		System.out.println("Ten department muon tao");
		String department = scanner.nextLine();
	}

		// Question 7:
        public static void Sochan() {
        Scanner scanner = new Scanner(System.in);
		System.out.println("Moi ban nhap vao 1 so chan");
		int n = scanner.nextInt();
		if (n % 2 == 0) {
			System.out.println("Nhap n: " + n);
		} else {
			System.out.println("Nhap sai vui long nhap lai");
		}
        }

		// Question 8:
         public static void Chucnang() {
             Scanner scanner = new Scanner(System.in);
		while (true) {
			System.out.println("Mời bạn nhập vào chức năng muốn sử dụng (1: tao account or 2: tao department");
					
			int cn = scanner.nextInt();

			switch (cn) {
			case 1:
				Account();
				break;
			case 2:
				Department();
				break;
			default:
				System.out.println("Mời bạn nhập lại");
			}
		}
         }
         // Question 5:
         public static void Account() {
		Scanner scanner = new Scanner(System.in);

		System.out.print("Nhap vao Account ID:");
		int id = scanner.nextInt();

		scanner.nextLine();
		System.out.print("Nhap vao username:");
		String userName = scanner.nextLine();

		System.out.print("Nhap vao Department:");
		String department = scanner.nextLine();

		System.out.print("Nhap vao Position ID (tu 1 -> 5):");
		int position = scanner.nextInt(6);
		switch (position) {
		case 1:
			System.out.print("Dev");
			break;
		case 2:
			System.out.print("Test");
			break;
		case 3:
			System.out.print("ScrumMaster");
			break;
		case 4:
			System.out.print("PM");
			break;
		default:
			System.out.print("HR");
		}

		System.out.print("\nNhap vao group:");
		scanner.nextLine();
		String groups = scanner.nextLine();

		System.out.print("\nNhap vao ngay:");
		String date = scanner.nextLine();
         }
}
     // Question 9:
//         
//		public static void themGroupVaoAccount() {
//             Scanner scanner = new Scanner(System.in);
//		//gia su cac n Account duoc luu trong mot mang
//    Department d1 = new Department(1,"sale");
//    Department d2 = new Department(2,"marketing");
//    Department d3 = new Department(3,"code");
//
//    Position p1 = new Position(1,"dev");
//    Position p2 = new Position(2,"test");
//    Position p3 = new Position(3,"scrum master");
// 
//   
//    }
//		}
         
	

	
	



