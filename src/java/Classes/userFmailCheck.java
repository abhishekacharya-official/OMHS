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
import java.util.Random;

/**
 *
 * @author 1405299
 */
public class userFmailCheck {
    public static String emailCheck(String mail){
            String pid=null;
        try{    
            Connection con=connDao.getCon();
            String query="select p_id from patient_login where p_email =?";
            PreparedStatement stm=con.prepareStatement(query);
            stm.setString(1, mail);
            ResultSet rs=stm.executeQuery();
            if(rs.next())
            {
                pid=rs.getString("p_id");
            }
        }
        catch(Exception e){
            e.printStackTrace();
        }return pid;
    }
    public static int fToken(String pid,int token){
        int status=0;
        try{
            
            Connection con=connDao.getCon();
            PreparedStatement pstmt=con.prepareStatement("insert into p_f_check (p_id, p_code) values (?,?)");
            pstmt.setString(1,pid);
            pstmt.setInt(2, token);
            status=pstmt.executeUpdate(); 
        }
        catch(Exception e){
            e.printStackTrace();
        }
        return status;
    }
    
    public static boolean fChecktoken(String uname, int token) {
        boolean st =false;
        try{
            Connection con=connDao.getCon();
            String query="select p_id from p_f_check where p_id=? and p_code=?";
            PreparedStatement stm=con.prepareStatement(query);
            stm.setString(1, uname);
            stm.setInt(2,token);
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
    
    public static int fSavePass(String uname, String pass) {
        String uuidi=null; int count=0;
        try{
            Connection con=connDao.getCon();
            String query="select p_salt from patient_login where p_id=? ";
            PreparedStatement stm=con.prepareStatement(query);
            stm.setString(1, uname);
            ResultSet rs=stm.executeQuery();
            if(rs.next()){
                uuidi=rs.getString("p_salt").trim();
                String p=uuidi+pass;
                String pswd=null;
                MessageDigest digest = MessageDigest.getInstance("MD5");
                digest.update(p.getBytes(), 0, p.length());
                pswd = new BigInteger(1, digest.digest()).toString(16);
                PreparedStatement pstmt=con.prepareStatement("update patient_login set p_pass='"+pswd+"' where p_id='"+uname+"'");
                count=pstmt.executeUpdate();
            }
            
        }
        catch(Exception e){
            e.printStackTrace();
        }
        return count;
    }
    
    public static boolean tokenDelete(String uname,int token){
        boolean status=false;
        try{
            Connection con=connDao.getCon();
            String query="delete from p_f_check where p_id=? and p_code=?";
            PreparedStatement stm=con.prepareStatement(query);
            stm.setString(1,uname);
            stm.setInt(2,token);
            int count=stm.executeUpdate();
            if(count>0){
               status=true;
            }
        }
        catch(Exception e){
            e.printStackTrace();
        }
        return status;
    }
}
