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
public class Group {
 int     groupID; 
 String  groupName; 
 int     creatorID; 
 Date     createDate;

    public Group() {
    }

    public Group(int groupID, String groupName, int creatorID, Date createDate) {
        this.groupID = groupID;
        this.groupName = groupName;
        this.creatorID = creatorID;
        this.createDate = createDate;
    }
}
