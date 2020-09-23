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
public class Worker extends CanBo {
    int rank;

    public Worker(String fullName, int age, String gender, String address) {
        super(fullName, age, gender, address);
        this.rank = rank;
    }

    Worker() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    @Override
    public void nhap(){
        Scanner sc = new Scanner(System.in);
     super.nhap();
     System.out.println("Nhập xếp hạng : \n");  
         rank = sc.nextInt(); 
     
    }
    
    @Override
    public void xuat(){
     super.xuat();
        System.out.println("Xếp hạng thứ: " + rank);
    }
}
