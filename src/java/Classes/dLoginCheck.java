/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Classes;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author 1405283
 */
import java.math.BigInteger;
import java.security.MessageDigest;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

public class dLoginCheck {
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
            String query="select doc_id, doc_email, doc_salt, doc_pass from doctor_details where doc_id =? OR doc_email=?";
            PreparedStatement stm=con.prepareStatement(query);
            stm.setString(1, uename);
            stm.setString(2, uename);
            ResultSet rs=stm.executeQuery();
            while(rs.next())
            {
                uname=rs.getString("doc_id").trim();
                ename=rs.getString("doc_email").trim();
                salt=rs.getString("doc_salt").trim();
                pswd1=rs.getString("doc_pass").trim();
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
}