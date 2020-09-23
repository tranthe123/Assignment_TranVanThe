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
public class Engineer extends CanBo  {
    String trainingIndustry;

    public Engineer(String trainingIndustry, String fullName, int age, String gender, String address) {
        super(fullName, age, gender, address);
        this.trainingIndustry = trainingIndustry;
    }

    Engineer() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    @Override
    public void nhap(){
        Scanner sc = new Scanner(System.in);
    super.nhap();
     System.out.println("Nhập chuyên ngành đào tạo : ");  
        trainingIndustry = sc.nextLine(); 
    
    }
    @Override
    public void xuat(){
    super.xuat();
        System.out.println("Chuyên ngành đào tạo la: " +trainingIndustry);
            
    }
}
