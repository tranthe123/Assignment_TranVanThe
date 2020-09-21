/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package testingsystem_assignment_4;

import java.util.Scanner;

/**
 *
 * @author heohu
 */
public class CanBo {
  
//    Question 1: inheritance
//Một đơn vị sản xuất gồm có các cán bộ là công nhân, kỹ sư, nhân viên.
//Mỗi cán bộ cần quản lý các dữ liệu: Họ tên, tuổi, giới tính(name, nữ,
//khác), địa chỉ.
//Cấp công nhân sẽ có thêm các thuộc tính riêng: Bậc (1 đến 10).
//Cấp kỹ sư có thuộc tính riêng: Nghành đào tạo.
//Các nhân viên có thuộc tính riêng: công việc.
//Hãy xây dựng các lớp CongNhan, KySu, NhanVien kế thừa từ lớp
//CanBo.
    String fullName;
    int age;
    String gender;
    String address;

    public CanBo() {
    }

    public CanBo(String fullName, int age, String gender, String address) {
        this.fullName = fullName;
        this.age = age;
        this.gender = gender;
        this.address = address;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getFullName() {
        return fullName;
    }

    public int getAge() {
        return age;
    }

    public String getGender() {
        return gender;
    }

    public String getAddress() {
        return address;
    }
     void nhap(){
     Scanner sc = new Scanner(System.in);
         System.out.println("Nhập họ tên : \n");
         fullName = sc.nextLine();
         System.out.println("Nhập tuổi : \n");  
         age = sc.nextInt(); 
         System.out.println("Nhập địa chỉ : \n");  
         address = sc.nextLine(); 
         System.out.println("Nhập giới tính : \n");  
         gender = sc.nextLine(); 
     }
     
     void xuat(){
         System.out.println("Họ tên là:" + fullName);
          System.out.println("Tuổi là:" + age);
           System.out.println("Địa chỉ là:" + address);
            System.out.println("Giới tính là:" + gender);
            
     }
       
        
        
}
