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
public class pCheckDelete {
    public static boolean pLoginDetails(String puname){
        boolean status=false;
        try{
            int x=1;
            Connection con=connDao.getCon();
            String query="update patient_login set p_cnfrm_status=? where p_id=?";
            PreparedStatement stm=con.prepareStatement(query);
            stm.setInt(1, x);
            stm.setString(2, puname);
            int count=stm.executeUpdate();
            if(count>0)
            {
              status=true;   
            }
            else
            {
                 status=false;   
            }
        }
        catch(Exception e){
            
        }
        return status;
    }
    
    public static boolean tokenDelete(String name,int otp){
        boolean status=false;
        try{
            Connection con=connDao.getCon();
            String query="delete from p_check where p_id=? and p_code=?";
            PreparedStatement stm=con.prepareStatement(query);
            stm.setString(1,name);
            stm.setInt(2,otp);
            int count=stm.executeUpdate();
            if(count>0){
               status=true;
            }
        }
        catch(Exception e){
            e.printStackTrace();
        }
        return status;
    }
}
