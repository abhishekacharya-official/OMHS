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
public class pDetailsSave {
    
    public static int detailsSave(String puname, String pfname, String plname, int age, String contact, String addr, 
            String gender, String bldgrp, int hfoot, int hinch, int weight ){
        int status=0;
        try{
            Connection con=connDao.getCon();
            PreparedStatement pstmt=con.prepareStatement("insert into patient_details (p_id,p_f_name,p_l_name,p_age,p_gender,p_contact,p_addr,p_blood_group,p_h_ft,p_h_in,p_weight) values (?,?,?,?,?,?,?,?,?,?,?)");
            pstmt.setString(1,puname);
            pstmt.setString(2,pfname);
            pstmt.setString(3,plname);
            pstmt.setInt(4,age);
            pstmt.setString(5,gender);
            pstmt.setString(6,contact);
            pstmt.setString(7,addr);
            pstmt.setString(8,bldgrp);
            pstmt.setInt(9,hfoot);
            pstmt.setInt(10,hinch);
            pstmt.setInt(11,weight);
            status=pstmt.executeUpdate();
        }
        catch(Exception e){
            e.printStackTrace();
        }
        return status;
    }
}
