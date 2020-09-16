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
class Question {
    CategoryQuestion categoryQuestion;
    String content;
    Date createDate;
    Account creator;
    int id;
    TypeQuestion typeQuestion;

    public Question() {
    }

    public Question(CategoryQuestion categoryQuestion, String content, Date createDate, Account creator, int id, TypeQuestion typeQuestion) {
        this.categoryQuestion = categoryQuestion;
        this.content = content;
        this.createDate = createDate;
        this.creator = creator;
        this.id = id;
        this.typeQuestion = typeQuestion;
    }
    
}
