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

/**
 *
 * @author 1405299
 */
public class hSettings {
     public static int checkUser(String uname, String pass1){
        int count=0;
         try{
            Connection con=connDao.getCon();
            String uuidi=null;
            String query="select h_salt from hospital_login where h_id=?";
            PreparedStatement stm=con.prepareStatement(query);
            stm.setString(1, uname);
            ResultSet rs=stm.executeQuery();
            while(rs.next()){
                uuidi=rs.getString("h_salt").trim();
                String p=uuidi+pass1;
                String pswd=null;
                MessageDigest digest = MessageDigest.getInstance("MD5");
                digest.update(p.getBytes(), 0, p.length());
                pswd = new BigInteger(1, digest.digest()).toString(16);
                PreparedStatement pstmt=con.prepareStatement("update hospital_login set h_pass=? where h_id=?");
                stm.setString(1, pswd);
                stm.setString(1, uname);
                count=pstmt.executeUpdate();
            }
         }
         catch(Exception e){
             e.printStackTrace();
         }
         return count;
     }
}
