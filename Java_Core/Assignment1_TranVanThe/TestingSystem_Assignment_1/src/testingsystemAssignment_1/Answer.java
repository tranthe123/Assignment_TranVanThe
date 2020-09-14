/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package testingsystemAssignment_1;

/**
 *
 * @author heohu
 */
public class Answer {
 int     answerID;
 String  content;
 int     questionID;
 int     isCorrect;

    public Answer() {
    }

    public Answer(int answerID, String content, int questionID, int isCorrect) {
        this.answerID = answerID;
        this.content = content;
        this.questionID = questionID;
        this.isCorrect = isCorrect;
    }
}
