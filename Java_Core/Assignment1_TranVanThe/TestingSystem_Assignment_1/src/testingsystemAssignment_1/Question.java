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
public class Question {
 int    questionID; 
 String content; 
 int    categoryID;
 int    typeID;
 int    creatorID;
 Date   createDate;

    public Question() {
    }

    public Question(int questionID, String content, int categoryID, int typeID, int creatorID, Date createDate) {
        this.questionID = questionID;
        this.content = content;
        this.categoryID = categoryID;
        this.typeID = typeID;
        this.creatorID = creatorID;
        this.createDate = createDate;
    }
}
