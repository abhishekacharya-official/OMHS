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
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.Calendar;
import java.util.UUID;

/**
 *
 * @author 1405299
 */
public class userSignup {
    public static int register(String puname,String pemail, String ppass){
        String pid=null,pmail=null;
        int status=0;
        try{
            
            Connection con=connDao.getCon();
            String query="select p_id, p_email from patient_login where p_id=? OR p_email=?";
            PreparedStatement stm=con.prepareStatement(query);
            stm.setString(1, puname);
            stm.setString(2, pemail);
            ResultSet rs=stm.executeQuery();
            while(rs.next()){
                pid=rs.getString("p_id");
                pmail=rs.getString("p_email");
                if(pid.equals(puname)){
                    status=1;
                }
                else if (pmail.equals(pmail)){
                     status=2;
                }
                else {
                     status=3;
                }    
            }
        }
        catch(Exception e){
            e.printStackTrace();
        }
        return status;
    }
  
    }

        
 

    