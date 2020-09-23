/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package testingsystem_assignment_5;

/**
 *
 * @author heohu
 */
public class TestingSystem_Assignment_5 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        //
        DienThoaiThongMinh dttm= new  DienThoaiThongMinh() ;
        dttm.chupHinh();
        dttm.suDung3G();
        dttm.guiTinNhan();
        dttm.tanCongKeXau();
        //
        DienThoaiCoDien dtcd = new  DienThoaiCoDien();
        dtcd.nheRadio();
        dtcd.guiTinNhan();
        dtcd.tanCongKeXau();
    }
    
}
