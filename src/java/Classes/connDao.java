/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Classes;

import java.sql.Connection;
import java.sql.*;

/**
 *
 * @author 1405299
 */
public class connDao {
    private static Connection con=null;
    static{
        try{
            Class.forName("com.mysql.jdbc.Driver");
            con=DriverManager.getConnection("jdbc:mysql://localhost:3306/omhs","root","Lovingchiku");  
        }
        catch(Exception e){
            e.printStackTrace();
        }
    }
    public static Connection getCon(){  
        return con;  
    }
}
