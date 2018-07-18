/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Classes;

import java.sql.Connection;
import java.sql.PreparedStatement;

/**
 *
 * @author 1405299
 */
public class hDetailsSave {
    public static int detailsSave(String huname, String hname, String contact, String addr, String state, String city){
        int status=0;
        try{
            Connection con=connDao.getCon();
            PreparedStatement pstmt=con.prepareStatement("insert into hospital_details (h_id,h_name,h_contact,h_addr,h_state,h_city) values (?,?,?,?,?,?)");
            pstmt.setString(1,huname);
            pstmt.setString(2,hname);
            pstmt.setString(3,contact);
            pstmt.setString(4,addr);
            pstmt.setString(5,state);
            pstmt.setString(6,city);
            status=pstmt.executeUpdate();
        }
        catch(Exception e){
            e.printStackTrace();
        }
        return status;
    }
}
