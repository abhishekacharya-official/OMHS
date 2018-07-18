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
public class hospSignup3 {
    public int registertoken(String huname, int hcode){
        int status=0;
        try{
            Connection con=connDao.getCon();
            PreparedStatement pstmt=con.prepareStatement("insert into h_check (h_id, h_code) values (?,?)");
            pstmt.setString(1,huname);
            pstmt.setInt(2, hcode);
            status=pstmt.executeUpdate(); 
        }
        catch(Exception e){
            e.printStackTrace();
        }
        return status;
    }
    
    public int registertoken1(String huname, int hcode){
        int status=0;
        try{
            Connection con=connDao.getCon();
            PreparedStatement pstmt=con.prepareStatement("insert into h_check (h_id, h_code) values (?,?)");
            pstmt.setString(1,huname);
            pstmt.setInt(2, hcode);
            status=pstmt.executeUpdate(); 
        }
        catch(Exception e){
            e.printStackTrace();
        }
        return status;
    }
}
