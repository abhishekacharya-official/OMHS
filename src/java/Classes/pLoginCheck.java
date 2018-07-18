/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Classes;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

/**
 *
 * @author 1405299
 */
public class pLoginCheck {
    public static boolean checkUser(String uename,String pswd) 
     {
      boolean st =false;
      String uname=null;
      String pswd1=null;
      String ename=null;
      String salt=null;
      String pswd2=null;
      String p=null;
      
      try{
            Connection con=connDao.getCon();
            String query="select p_id, p_email, p_salt, p_pass from patient_login where p_id =? OR p_email=?";
            PreparedStatement stm=con.prepareStatement(query);
            stm.setString(1, uename);
            stm.setString(2, uename);
            ResultSet rs=stm.executeQuery();
            while(rs.next())
            {
                uname=rs.getString("p_id").trim();
                ename=rs.getString("p_email").trim();
                salt=rs.getString("p_salt").trim();
                pswd1=rs.getString("p_pass").trim();
                p=salt+pswd;
                MessageDigest digest = MessageDigest.getInstance("MD5");
                digest.update(p.getBytes(), 0, p.length());
                pswd2 = new BigInteger(1, digest.digest()).toString(16);
                if(pswd2.equals(pswd1)){
                    st=true; 
                    
                }
                else{
                    st=false; 
                    
                }
            }
        
      }catch(Exception e)
      {
          e.printStackTrace();
      }
      return st;                    
  }   
    
  public static boolean checkUser1(String uename) 
     {
      boolean st =false;String uname=null;int x=1;
      try{
            Connection con=connDao.getCon();
            String query="select p_id from patient_login where p_id =? and p_cnfrm_status=?";
            PreparedStatement stm=con.prepareStatement(query);
            stm.setString(1, uename);
            stm.setInt(2, x);
            ResultSet rs=stm.executeQuery();
            while(rs.next())
            {
                uname=rs.getString("p_id").trim();
                st=true;
            }
        
      }catch(Exception e)
      {
          e.printStackTrace();
      }
      return st;                    
  }   
  public static boolean pTokenDetails(String puname,int otp){
        boolean status=false;
        try{
            Connection con=connDao.getCon();
            String query="update p_check set p_code=? where p_id=?";
            PreparedStatement stm=con.prepareStatement(query);
            stm.setInt(1, otp);
            stm.setString(2, puname);
            int count=stm.executeUpdate();
            if(count>0)
            {
              status=true;   
            }
            else
            {
                 status=false;   
            }
        }
        catch(Exception e){
            
        }
        return status;
    }
    
}
