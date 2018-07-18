/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Classes;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.Timestamp;

/**
 *
 * @author 1405299
 */
public class userSignup3 {
    public int registertoken(String puname, int pcode){
        int status=0;
        try{
            Connection con=connDao.getCon();
            PreparedStatement pstmt=con.prepareStatement("insert into p_check (p_id, p_code) values (?,?)");
            pstmt.setString(1,puname);
            pstmt.setInt(2, pcode);
            status=pstmt.executeUpdate(); 
        }
        catch(Exception e){
            e.printStackTrace();
        }
        return status;
    }
}
