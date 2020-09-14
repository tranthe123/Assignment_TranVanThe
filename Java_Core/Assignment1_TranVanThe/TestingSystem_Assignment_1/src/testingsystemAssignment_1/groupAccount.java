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
public class groupAccount {
 int   groupID;
 int   accountID; 
Date   joinDate; 

    public groupAccount() {
    }

    public groupAccount(int groupID, int accountID, Date joinDate) {
        this.groupID = groupID;
        this.accountID = accountID;
        this.joinDate = joinDate;
    }
}
