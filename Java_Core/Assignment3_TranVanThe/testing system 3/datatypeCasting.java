/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package assignment3;

import java.util.Random;

/**
 *
 * @author heohu
 */
import java.util.Scanner;

//    Exercise 1: Datatype Casting
public class datatypeCasting{

	public static void main(String[] args) {
		 question2_3();
	}

	

	// Question 2:
	// Lấy ngẫu nhiên 1 số có 5 chữ số (những số dưới 5 chữ số thì sẽ thêm
	// có số 0 ở đầu cho đủ 5 chữ số)

	// Question 3:
	// Lấy 2 số cuối của số ở Question 2 và in ra.
	// Gợi ý:
	// Cách 1: convert số có 5 chữ số ra String, sau đó lấy 2 số cuối
	// Cách 2: chia lấy dư số đó cho 100
	public static void question2_3() {
		int max = 99999;
                int min =0;
		int a = (int) (Math.random() * max)+ min ;
		while (a < 10000) {
			a = a * 10;
        //Question2
		}
		System.out.printf("=============\n");
		System.out.println("Số ngẫu nhiên: " + a);
       //Question3
		System.out.println("=============\n");
		String b = String.valueOf(a);
		System.out.println("Hai số cuối: " + b.substring(3));
	}

	
}

