/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Classes;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author 1405299
 */
public class hEditDetails {
     public static int editDetails(String huname, String hname, String contact, String addr, String state, String city){
         int count=0;
         try{
            Connection con=connDao.getCon();
            String query="update hospital_details set h_name=?,h_contact=?,h_addr=?,h_state=?,h_city=? where h_id=?";
            PreparedStatement stm=con.prepareStatement(query);
            stm.setString(1, hname);
            stm.setString(2, contact);
            stm.setString(3, addr);
            stm.setString(4, state);
            stm.setString(5, city);
            stm.setString(6, huname);
            count=stm.executeUpdate();
         }
         catch(Exception e)
         {
             e.printStackTrace();
         }
         return count;
     }
}
