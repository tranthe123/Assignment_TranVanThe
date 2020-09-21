/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package testingsystem_assignment_4;

import java.util.ArrayList;
import java.util.Scanner;

/**
 *
 * @author heohu
 */
public class Main {
    public static void main(String[] args){
//    Question 2: Tiếp tục Question 1
//Xây dựng lớp QLCB(quản lý cán bộ) cài đặt các phương thức thực
//hiện các chức năng sau:
//a) Thêm mới cán bộ.
      

//        CanBo canbo = new CanBo();
//        canbo.fullName = "Tran Van The";
//        canbo.address = "Nam Dinh";
//        canbo.age = 21;
//        canbo.gender = "Male";
//        System.out.println("Thông tin cán bô là \n" +canbo.fullName + "\n"+ canbo.address + "\n"+ canbo.age + "\n"+ canbo.gender);
//    CanBo canbo1 = new CanBo();
//        canbo1.fullName = "Nguyen Manh Tuyen";
//        canbo1.address = "Nam Dinh";
//        canbo1.age = 21;
//        canbo1.gender = "Male";
//         System.out.println("Thông tin cán bô là \n" +canbo1.fullName + "\n"+ canbo1.address + "\n"+ canbo1.age + "\n"+ canbo1.gender);
//b) Tìm kiếm theo họ tên.
//        if(canbo.fullName == "Tran Van The"){
//            System.out.println("Thông tin cán bô là \n" +canbo.fullName + "\n"+ canbo.address + "\n"+ canbo.age + "\n"+ canbo.gender);
//        }
//        else{
//            System.out.println("Moi nhap lai:");
//        };
        
//c) Hiện thị thông tin về danh sách các cán bộ.
        
//d) Nhập vào tên của cán bộ và delete cán bộ đó
//e) Thoát khỏi chương trình.
        ArrayList<CanBo> canboList = new ArrayList();
        int choose;
        Scanner sc = new Scanner(System.in);
        do{
        showMenu();
            System.out.println("Choose: ");
            choose = Integer.parseInt(sc.nextLine());
            switch(choose){
                case 1:
                    int n;
                    System.out.println("Nhập số cán bộ cần thêm:");
                    n = Integer.parseInt(sc.nextLine());
                    for(int i = 0; i< n;i++){
                    CanBo canbo = new CanBo();
                    canbo.nhap();
                    canboList.add(canbo);
                    }
                    break;
               case 2:
                    System.out.println("Nhập họ tên cần tìm kiếm: ");
                    String fullNameSearch = sc.nextLine();
                    for (int i = 0; i < canboList.size(); i++) {
                         CanBo canbo = new CanBo();
                        if(canbo.getFullName().equalsIgnoreCase(fullNameSearch)){
                        canbo.xuat();
                        }
                            
                        }

                    break;
                case 3:
                    for(int i =0;i < canboList.size();i++){
                        canboList.get(i).xuat();
                    
                    }
                    break;
                case 4:
                   
                    System.out.println("Nhập số cán bộ cần thêm:");
                    
                    n = Integer.parseInt(sc.nextLine());
                    for(int i = 0; i< n;i++){
                    CanBo canbo = new CanBo();
                    canbo.nhap();
                    canboList.add(canbo);
                    for(int j =0;j < canboList.size();j++){
                     if(j == i){
                      canboList.remove(j);
                      break;
                     }
                    }
                    
                    }
                    break;
                case 5:
                    System.out.println("Thoát chương trình");
                    break;
                default:
                    System.err.println("Nhâp sai");
                    break;
                    
        }
        }while(choose != 5);
    }
    static void showMenu(){
        System.out.println("1. Thêm mới cán bộ:");
        System.out.println("2. Tìm kiếm theo họ tên:");
        System.out.println("3. Hiển thị thông tin về danh sách cán bộ");
        System.out.println("4. Nhập vào tên của cán bộ và delete cán bộ đó");
        System.out.println("5. Thoát khỏi chương trình");
    }
    //Question 3
//    public  void HighSchoolStudent(){
//         HighSchoolStudent hss = new HighSchoolStudent();
//                 hss.id = 1;
//                 hss.name = "Nam";
//                 hss.clazz ="Chuyên Văn";
//                 hss.desiredUniversity ="Đại học công nghệ";
//    }
    //Question 4:
}
