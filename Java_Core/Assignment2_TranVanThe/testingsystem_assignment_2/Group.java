/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package testingsystem_assignment_2;

import java.util.Date;

/**
 *
 * @author heohu
 */
class Group {
    int id;
    String name;
    Date createDate;
    Account[] accounts;

    public Group() {
    }

    public Group(int id, String name, Date createDate, Account[] accounts) {
        this.id = id;
        this.name = name;
        this.createDate = createDate;
        this.accounts = accounts;
    }
    
}
