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
class Account {
    int id;
    Department department;
    String email;
    String fullname;
    Position position;
    String username;
    String[] groups;
    Date createDate;

    public Account() {
    }

    public Account(int id, Department department, String email, String fullname, Position position, String[] groups, Date createDate) {
        this.id = id;
        this.department = department;
        this.email = email;
        this.fullname = fullname;
        this.position = position;
        this.groups = groups;
        this.createDate = createDate;
    }

   
    
}
