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
import java.sql.Timestamp;
import java.util.Calendar;

/**
 *
 * @author 1405299
 */
//KICHI KAMA KU NAI
public class getDateC {
    public static int getDateCa(String puname, String token){
        int m=0,code;
        try{
            
            Connection con=connDao.getCon();
            String query="select p_code from p_check where p_id='"+puname+"' AND p_token='"+token+"'";
            Statement stmt=con.createStatement();
            //stm.setString(1, puname);
            //stm.setString(2, token);
            ResultSet rs=stmt.executeQuery(query);
            while(rs.next()){
                //m=date2.getTime()-date1.getTime();
                code=rs.getInt("p_code");
                m=1;
            }
        }
        catch(Exception e){
            
        }return m;
        
    }
}
