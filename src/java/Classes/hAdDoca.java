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
import java.util.UUID;

/**
 *
 * @author 1405299
 */
public class hAdDoca {
    public static int register(String hname,String uid, String uname, String contact, String pass, String dname, String demail, int slots){
        int status=0;
        try{
            Connection con=connDao.getCon();
            String uuidi = UUID.randomUUID().toString();
            String p=uuidi+pass;
            String pswd=null;
            int doc_avail=1;
            MessageDigest digest = MessageDigest.getInstance("MD5");
            digest.update(p.getBytes(), 0, p.length());
            pswd = new BigInteger(1, digest.digest()).toString(16);
            PreparedStatement pstmt=con.prepareStatement("insert into doctor_details(doc_h_id, doc_id,doc_name,doc_salt,doc_pass,doc_dept_id,doc_contact,doc_email,doc_n_appt,doc_avail) values (?,?,?,?,?,?,?,?,?,?)");
            pstmt.setString(1,hname);
            pstmt.setString(2,uid);
            pstmt.setString(3,uname);
            pstmt.setString(4,uuidi);
            pstmt.setString(5,pswd);
            pstmt.setString(6,dname);
            pstmt.setString(7,contact);
            pstmt.setString(8,demail);
            pstmt.setInt(9,slots);
            pstmt.setInt(10,doc_avail);
            status=pstmt.executeUpdate(); 
        }
        catch(Exception e){
            e.printStackTrace();
        }
        return status;
     }
}
