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
public class hospSignup {
    public static int register(String huname,String hemail, String hpass, String regno){
        String hid=null,hmail=null,hreg=null;
        int status=0;
        try{
            Connection con=connDao.getCon();
            String query="select h_id, h_email, h_regis from hospital_login where h_id=? OR h_email=? OR h_regis=?";
            PreparedStatement stm=con.prepareStatement(query);
            stm.setString(1, huname);
            stm.setString(2, hemail);
            stm.setString(3, regno);
            ResultSet rs=stm.executeQuery();
            while(rs.next()){
                hid=rs.getString("h_id");
                hmail=rs.getString("h_email");
                hreg=rs.getString("h_regis");
                if(hid.equals(huname)){
                   status=1;
                }
                else if (hmail.equals(hemail)){
                    status=2;
                }
                else if (hreg.equals(regno)){
                    status=3;
                }
                else{
                    status=4;
                }
            }
        }
        catch(Exception e){
            
        }
        return status;
    }
}
