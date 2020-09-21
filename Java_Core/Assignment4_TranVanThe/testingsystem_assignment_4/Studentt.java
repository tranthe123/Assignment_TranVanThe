/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package testingsystem_assignment_4;

/**
 *
 * @author heohu
 */
//Tạo class abstract Student kế thừa Person gồm các property id, name
// và tạo constructor có 2 parameter id, name
public abstract class Studentt extends Person {
    int id;

   
    public Studentt(int id, String name) {
        super(name);
        this.id = id;
    }
   
    
}
