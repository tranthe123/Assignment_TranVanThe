/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package testingsystem_assignment_4;

/**
 *
 * @author heohu
 */
public class Account {
    String id;
    String name;
    int balance;

    public Account(String id, String name, int balance) {
        this.id = id;
        this.name = name;
        this.balance = balance;
    }

    public String getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public int getBalance() {
        return balance;
    }
 public int debit() {
        return 0;
     
 }   
 public void tranferTo(Account account, int amount) {
        
     
 }   

}
