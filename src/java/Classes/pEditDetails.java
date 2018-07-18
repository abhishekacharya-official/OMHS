/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Classes;

import java.sql.Connection;
import java.sql.PreparedStatement;

/**
 *
 * @author 1405299
 */
public class pEditDetails {
     public static int editDetails(String puname, String pfname, String plname, int age, String contact, String addr, 
             String gender, String bldgrp, int hfoot, int hinch, int weight){
         int count=0;
         try{
            Connection con=connDao.getCon();
            PreparedStatement pstmt=con.prepareStatement("update patient_details set p_f_name=?,p_l_name=?,p_age=?,p_gender=?,"
                    + "p_contact=?,p_addr=?,p_blood_group=?,p_h_ft=?,p_h_in=?,p_weight=? where p_id=?");
            pstmt.setString(1,pfname);
            pstmt.setString(2,plname);
            pstmt.setInt(3,age);
            pstmt.setString(4,gender);
            pstmt.setString(5,contact);
            pstmt.setString(6,addr);
            pstmt.setString(7,bldgrp);
            pstmt.setInt(8,hfoot);
            pstmt.setInt(9,hinch);
            pstmt.setInt(10,weight);
            pstmt.setString(11,puname);
            count=pstmt.executeUpdate();
         }
         catch(Exception e){
             e.printStackTrace();
         }
         return count;
     }
}
