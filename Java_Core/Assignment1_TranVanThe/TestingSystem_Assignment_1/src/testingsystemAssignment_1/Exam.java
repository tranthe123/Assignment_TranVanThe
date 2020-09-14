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
public class Exam {
 int    examID;
 String code;
 String title; 
 int    categoryID;
 Date   duration;
 int    creatorID;
 Date   createDate;

    public Exam() {
    }

    public Exam(int examID, String code, String title, int categoryID, Date duration, int creatorID, Date createDate) {
        this.examID = examID;
        this.code = code;
        this.title = title;
        this.categoryID = categoryID;
        this.duration = duration;
        this.creatorID = creatorID;
        this.createDate = createDate;
    }
}
