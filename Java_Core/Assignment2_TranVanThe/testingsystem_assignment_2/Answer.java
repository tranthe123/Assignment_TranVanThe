/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package testingsystem_assignment_2;

/**
 *
 * @author heohu
 */
class Answer {
    int id;
    String content;
    boolean isCorrect;
    Question question;

    public Answer() {
    }

    public Answer(int id, String content, boolean isCorrect, Question question) {
        this.id = id;
        this.content = content;
        this.isCorrect = isCorrect;
        this.question = question;
    }
    
}
