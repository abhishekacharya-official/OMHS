/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Classes;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.UUID;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author 1405299
 */
public class userAddA {
    public static int detailsSave(String puname, String pfname, String plname, int age, String contact, String addr, 
            String gender, String bldgrp, int hfoot, int hinch, int weight, String hosp,String dept,String doctor, String date1 ) throws ParseException{
        long millis=System.currentTimeMillis();  
        java.sql.Date date2=new java.sql.Date(millis);
        //String startDate="01-02-2013";
        SimpleDateFormat sdf1 = new SimpleDateFormat("dd-MM-yyyy");
        java.util.Date date = sdf1.parse(date1);
        java.sql.Date sqlStartDate = new java.sql.Date(date.getTime()); 
        //DateFormat df=new SimpleDateFormat("dd-MM-yyyy");
        //Date date21 = df.parse(date1);
        //Date datea=new SimpleDateFormat("dd-MM-yyyy").parse(date1);
        //Date date=Date.valueOf(date1);
        String name1=pfname+" "+plname;
        int status=0;
        try{
            Connection con=connDao.getCon();
            
            PreparedStatement pstmt=con.prepareStatement("insert into visiting (v_h_id,v_p_id,v_doc_id,v_d_id,v_booking_date,v_app_date,v_name,v_age,v_gender,v_contact,v_addr,v_blood_group,v_h_ft,v_h_in,v_weight) values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
            
            pstmt.setString(1,hosp);
            pstmt.setString(2,puname);
            pstmt.setString(3,doctor);
            pstmt.setString(4,dept);
            pstmt.setDate(5,date2);
            pstmt.setDate(6, sqlStartDate);
            pstmt.setString(7,name1);
            pstmt.setInt(8,age);
            pstmt.setString(9,gender);
            pstmt.setString(10,contact);
            pstmt.setString(11,addr);
            pstmt.setString(12,bldgrp);
            pstmt.setInt(13,hfoot);
            pstmt.setInt(14,hinch);
            pstmt.setInt(15,weight);
            status=pstmt.executeUpdate();
            
        }
        catch(Exception e){
            e.printStackTrace();
        }
        return status;
    }
    public static int checkSlot(String doctor,String date1b)
    {
        String st;int stat=-1,stat1;int abc=-1;
        try{
        Connection con=connDao.getCon();
        String query="select doc_n_appt from doctor_details where doc_id =?";
            PreparedStatement stm=con.prepareStatement(query);
            stm.setString(1, doctor);
            
            ResultSet rs=stm.executeQuery();
            
            if(rs.next())
            {
                st=rs.getString("doc_n_appt");
                stat=Integer.parseInt(st);
                }
        }catch(Exception e)
        {
            e.printStackTrace();
        }
        try{
            
                Connection con=connDao.getCon();
                String query1="select count(v_app_id) as cc from visiting where v_app_date=? and v_doc_id=?";
                PreparedStatement stm1=con.prepareStatement(query1);
                SimpleDateFormat sdf1 = new SimpleDateFormat("dd-MM-yyyy");
java.util.Date date = sdf1.parse(date1b);
java.sql.Date sqlStartDate = new java.sql.Date(date.getTime()); 
            
                stm1.setDate(1, sqlStartDate);
                stm1.setString(2, doctor);
            ResultSet rs1=stm1.executeQuery();
            if(rs1.next())
            {
                abc=rs1.getInt("cc");
                System.out.println(abc);
                System.out.println(stat);
            }
            if(stat<=abc)
            {  
                    //Slots not empty
                    return 0;
                         
            }
        }    
                
                
         catch(Exception e)
         {
             e.printStackTrace();
        }
        
        return -1;
    }   
}