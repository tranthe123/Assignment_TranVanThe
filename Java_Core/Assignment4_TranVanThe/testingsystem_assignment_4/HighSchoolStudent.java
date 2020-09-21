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
public abstract class HighSchoolStudent extends Studentt{
  String clazz;
  String desiredUniversity;

    public HighSchoolStudent(String clazz, String desiredUniversity, int id, String name) {
        super(id, name);
        this.id = 1;
        this.name = "Nam";
        this.clazz = "Chuyên Văn";
        this.desiredUniversity = "Đại học công nghệ";
         
    }
    
}
