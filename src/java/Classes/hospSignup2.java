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
import java.sql.Timestamp;
import java.util.Calendar;
import java.util.UUID;

/**
 *
 * @author 1405299
 */
public class hospSignup2 {
    public static int register(String huname,String hemail, String hpass, String regno){
        int count=0,a=0,c=1;
        String hid=null,hmail=null,err=null,err1=null,err2=null, err3=null,msg=null;
        try{
            Connection con=connDao.getCon();
            String uuidi = UUID.randomUUID().toString();
            String p=uuidi+hpass;
            String pswd=null;
            MessageDigest digest = MessageDigest.getInstance("MD5");
            digest.update(p.getBytes(), 0, p.length());
            pswd = new BigInteger(1, digest.digest()).toString(16);
            Timestamp date1 = new java.sql.Timestamp(Calendar.getInstance().getTime().getTime());
            PreparedStatement pstmt=con.prepareStatement("insert into hospital_login (h_id, h_regis, h_email, h_salt, h_pass,h_dor,h_cnfrm_status,h_avail) values (?,?,?,?,?,?,?,?)");
            pstmt.setString(1,huname);
            pstmt.setString(2,regno);
            pstmt.setString(3,hemail);
            pstmt.setString(4,uuidi);
            pstmt.setString(5,pswd);
            pstmt.setTimestamp(6,date1);
            pstmt.setInt(7,a);
            pstmt.setInt(8,c);
            count=pstmt.executeUpdate(); 
        }
        catch(Exception e){
            e.printStackTrace();
        }
        return count;
    }
}
