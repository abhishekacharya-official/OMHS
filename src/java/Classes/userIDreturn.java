/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Classes;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

/**
 *
 * @author 1405299
 */
public class userIDreturn {
    
    
    public static String returnUser(String uid){
        String uname=null;
        try{
            Connection con=connDao.getCon();
            String query="select p_id from patient_login where p_id=? or p_email=?";
            PreparedStatement stm=con.prepareStatement(query);
            stm.setString(1, uid);
            stm.setString(2, uid);
            ResultSet rs=stm.executeQuery();
            
            while(rs.next())
            {
                uname=rs.getString("p_id").trim(); 
                
            }
        }
        catch(Exception e){
            e.printStackTrace();
        }
        return uname;
    }
    
    public static String returnEmail(String uid){
        String uname=null;
        try{
            Connection con=connDao.getCon();
            String query="select p_email from patient_login where p_id=?";
            PreparedStatement stm=con.prepareStatement(query);
            stm.setString(1, uid);
            ResultSet rs=stm.executeQuery();
            while(rs.next())
            {
                uname=rs.getString("p_email").trim(); 
            }
        }
        catch(Exception e){
            e.printStackTrace();
        }
        return uname;
    }
}
