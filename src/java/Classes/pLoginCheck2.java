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
public class pLoginCheck2 {
    
    public static boolean checkUser(String uname) {
        boolean st =false;
        try{
            Connection con=connDao.getCon();
            String query="select p_id from patient_details where p_id=?";
            PreparedStatement stm=con.prepareStatement(query);
            stm.setString(1, uname);
            ResultSet rs=stm.executeQuery();
            while(rs.next()){
                st=true;
            }
            
        }
        catch(Exception e){
            e.printStackTrace();
        }
        return st;
    }
}
