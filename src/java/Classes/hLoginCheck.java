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
public class hLoginCheck {
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
            String query="select h_id, h_email, h_salt, h_pass from hospital_login where h_id =? OR h_email=?";
            PreparedStatement stm=con.prepareStatement(query);
            stm.setString(1, uename);
            stm.setString(2, uename);
            ResultSet rs=stm.executeQuery();
            while(rs.next())
            {
                uname=rs.getString("h_id").trim();
                ename=rs.getString("h_email").trim();
                salt=rs.getString("h_salt").trim();
                pswd1=rs.getString("h_pass").trim();
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
    
  public static String returnUser(String uid){
        String uname=null;
        try{
            Connection con=connDao.getCon();
            String query="select h_id from hospital_login where h_id=? or h_email=?";
            PreparedStatement stm=con.prepareStatement(query);
            stm.setString(1, uid);
            stm.setString(2, uid);
            ResultSet rs=stm.executeQuery();
            
            while(rs.next())
            {
                uname=rs.getString("h_id").trim(); 
                
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
            String query="select h_email from hospital_login where h_id=?";
            PreparedStatement stm=con.prepareStatement(query);
            stm.setString(1, uid);
            ResultSet rs=stm.executeQuery();
            while(rs.next())
            {
                uname=rs.getString("h_email").trim(); 
            }
        }
        catch(Exception e){
            e.printStackTrace();
        }
        return uname;
    }
    
    public static boolean checkUser1(String uename) 
     {
      boolean st =false;String uname=null;int x=1;
      try{
            Connection con=connDao.getCon();
            String query="select h_id from hospital_login where h_id =? and h_cnfrm_status=?";
            PreparedStatement stm=con.prepareStatement(query);
            stm.setString(1, uename);
            stm.setInt(2, x);
            ResultSet rs=stm.executeQuery();
            while(rs.next())
            {
                uname=rs.getString("h_id").trim();
                st=true;
            }
        
      }catch(Exception e)
      {
          e.printStackTrace();
      }
      return st;                    
  }   
    
  public static boolean checkUser(String uname) {
        boolean st =false;
        try{
            Connection con=connDao.getCon();
            String query="select h_id from hospital_details where h_id=?";
            PreparedStatement stm=con.prepareStatement(query);
            stm.setString(1, uname);
            ResultSet rs=stm.executeQuery();
            while(rs.next()){
                st=true;
            }
            
        }
        catch(Exception e){
            e.printStackTrace();
        }
        return st;
    }
  
  public static boolean pTokenDetails(String huname,int otp){
        boolean status=false;
        try{
            Connection con=connDao.getCon();
            String query="update h_check set h_code=? where h_id=?";
            PreparedStatement stm=con.prepareStatement(query);
            stm.setInt(1, otp);
            stm.setString(2, huname);
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
