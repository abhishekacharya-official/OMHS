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
public class hEmailC {
    public static boolean register(String name,int otp){
            String name1=null;int otp1=0; boolean status=false;
        try{    
            Connection con=connDao.getCon();
            String query="select h_id, h_code from h_check where h_id =? and h_code=?";
            PreparedStatement stm=con.prepareStatement(query);
            stm.setString(1, name);
            stm.setInt(2, otp);
            ResultSet rs=stm.executeQuery();
            while(rs.next())
            {
                name1=rs.getString("h_id");
                otp1=rs.getInt("h_code");System.out.println(otp1);System.out.println(otp1);
                if(otp==otp1){
                    status=true; 
                }
                else{
                    status=false; 
                }
            }
        }
        catch(Exception e){
            e.printStackTrace();
        }return status;
    }
}
