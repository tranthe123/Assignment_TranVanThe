/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package testingsystemAssignment_1;

import java.util.Date;

/**
 *
 * @author heohu
 */
public class Account {
 int    accountID;
String  Email;
String  userName;
String  fullName;
int     departmentID;
int     positionID;
Date    createDate;

    public Account() {
    }

    public Account(int accountID, String Email, String userName, String fullName, int departmentID, int positionID, Date createDate) {
        this.accountID = accountID;
        this.Email = Email;
        this.userName = userName;
        this.fullName = fullName;
        this.departmentID = departmentID;
        this.positionID = positionID;
        this.createDate = createDate;
    }
}
