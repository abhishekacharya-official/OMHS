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
public class psettings {
    public static int checkUser(String uname, String pass1){
        int count=0;
         try{
            Connection con=connDao.getCon();
                String uuidi=null;
                
                String query="select p_salt from patient_login where p_id=?";
                PreparedStatement stm=con.prepareStatement(query);
                stm.setString(1, uname);
                ResultSet rs=stm.executeQuery();
                while(rs.next()){
                    uuidi=rs.getString("p_salt").trim();
                    String p=uuidi+pass1;
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
        }return count;
    }
}
