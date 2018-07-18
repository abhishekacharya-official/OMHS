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
public class userSignup2 {
    public static int register(String puname,String pemail, String ppass){
        String pid=null,pmail=null,err=null,err1=null,err2=null, err3=null,msg=null;
        int status=0;
        try{
            Connection con=connDao.getCon();
            String uuidi = UUID.randomUUID().toString();
            String p=uuidi+ppass;
            String pswd=null;
            MessageDigest digest = MessageDigest.getInstance("MD5");
            digest.update(p.getBytes(), 0, p.length());
            pswd = new BigInteger(1, digest.digest()).toString(16);
            Timestamp date1 = new java.sql.Timestamp(Calendar.getInstance().getTime().getTime());
            int st=0;
            PreparedStatement pstmt=con.prepareStatement("insert into patient_login (p_id, p_email, p_salt, p_pass, p_dor,p_cnfrm_status) values (?,?,?,?,?,?)");
            pstmt.setString(1,puname);
            pstmt.setString(2,pemail);
            pstmt.setString(3,uuidi);
            pstmt.setString(4,pswd);
            pstmt.setTimestamp(5,date1);
            pstmt.setInt(6,st);
            status=pstmt.executeUpdate(); 
        }
        catch(Exception e){
            e.printStackTrace();
        }return status;
    }
}
