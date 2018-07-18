/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Classes;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

/**
 *
 * @author 1405299
 */
public class hAdDoc {
    public static boolean register(String uid, String hname){
        String pid=null,pmail=null;
        boolean status=false;
        try{
            Connection con=connDao.getCon();
            String query="select doc_id from doctor_details where doc_id=?";
            PreparedStatement stm=con.prepareStatement(query);
            stm.setString(1, uid);
            ResultSet rs=stm.executeQuery();
            while(rs.next()){
                status=true;
            }
        }
        catch(Exception e){
            e.printStackTrace();
        }
        return status;
    }
}
