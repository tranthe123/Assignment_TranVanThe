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
        //    Question 1:
public class Student {
  // a) Tất cả các property sẽ để là private để các class khác không
//chỉnh sửa hay nhìn thấy
 private int id;
 private String   name;
 private String   hometown;
 private float  point ;
 private String   academicPower;
//b) Tạo constructor cho phép khi khởi tạo mỗi student thì người
//dùng sẽ nhập vào tên, hometown và có điểm học lực = 0
    public Student() {
    }

    public Student(int id, String name, String hometown, float point, String academicPower) {
        this.id = id;
        this.name = name;
        this.hometown = hometown;
        this.point = 0;
        this.academicPower = academicPower;
    }

    public void setPoint(float point) {
        this.point = point;
    }

    public int getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public String getHometown() {
        return hometown;
    }

    public String getAcademicPower() {
        return academicPower;
    }

    public float getPoint() {
        return point;
    }
    
    //c) Tạo 1 method cho phép set điểm vào
    public void diem(){
       Student student1 = new Student();
      student1.point = 9.5f;
      Student student2 = new Student();
       student2.point = 8.5f;
        System.out.println(student1.point);
        System.out.println(student2.point);
    }
    //d) Tạo 1 method cho phép cộng thêm điểm
    public void congDiem(){
        Student student1 = new Student();
      student1.point = 9.5f;
      Student student2 = new Student();
       student2.point = 8.5f;
        System.out.println( student1.point + student2.point );
    }
    
//e) Tạo 1 method để in ra thông tin của sinh viên bao gồm có tên,
//điểm học lực ( nếu điểm <4.0 thì sẽ in ra là Yếu, nếu điểm >
//4.0 và < 6.0 thì sẽ in ra là trung bình, nếu điểm > 6.0 và < 8.0
//thì sẽ in ra là khá, nếu > 8.0 thì in ra là Giỏi)
    public void inThongTinSv(){
      
        Student student1 = new Student();
       //
        student1.point = 8.0f;
        System.out.println("Thông tin sinh viên");
        
        System.out.println("Tên sinh viên là:" +this.name);
      if(this.point < 4.0f){
          System.out.println("Yếu");
      }
      else if (this.point > 4.0f && this.point < 6.0f){
        System.out.println("Trung bình");
          
      } else if (this.point > 6.0f && this.point < 8.0f) {
          System.out.println("Khá");
      }
      else {
          System.out.println("Giỏi");
      }
    }
}
    



        
  
