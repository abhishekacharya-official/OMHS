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

/**
 *
 * @author 1405299
 */
public class dEditDetails {
    public static int editDetails(String did, String dname, String dcon, String dmail, int slot){
         int count=0;
         try{
            Connection con=connDao.getCon();
            String query="update doctor_details set doc_name=?,doc_contact=?,doc_email=?,doc_n_appt=? where doc_id=?";
            PreparedStatement stm=con.prepareStatement(query);
            stm.setString(1, dname);
            stm.setString(2, dcon);
            stm.setString(3, dmail);
            stm.setInt(4, slot);
            stm.setString(5, did);
            count=stm.executeUpdate();
         }
         catch(Exception e)
         {
             e.printStackTrace();
         }
         return count;
     }
    public static int checkUser(String did, String pass){
        int count=0;String uuidi;
         try{ 
                
                 Connection con=connDao.getCon();
                String query="select doc_salt from doctor_details where doc_id=?";
                PreparedStatement stm=con.prepareStatement(query);
                stm.setString(1, did);
                ResultSet rs=stm.executeQuery();
                while(rs.next()){
                    uuidi=rs.getString("doc_salt").trim();
                    String p=uuidi+pass;
                    String pswd=null;
                    MessageDigest digest = MessageDigest.getInstance("MD5");
                    digest.update(p.getBytes(), 0, p.length());
                    pswd = new BigInteger(1, digest.digest()).toString(16);
                    PreparedStatement pstmt=con.prepareStatement("update doctor_details set doc_pass=? where p_id=?");
                    pstmt.setString(1, pswd);
                    pstmt.setString(2, did);
                    count=pstmt.executeUpdate();
                }
         }
         catch(Exception e){
            e.printStackTrace();
        }return count;
    }
}


