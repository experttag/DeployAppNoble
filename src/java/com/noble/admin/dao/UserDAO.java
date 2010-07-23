/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.noble.admin.dao;

import com.noble.admin.database.DBConnection;
import java.sql.ResultSet;
import java.sql.SQLException;
import org.apache.log4j.Logger;


/**
 *
 * @author home
 */
public class UserDAO {


    private static Logger log = Logger.getLogger(UserDAO.class);
    
    public static int  getUser(DBConnection db,String userName, String password){

        log.info(" getUser: retrieving user");

        int status = 0;
        db.connect();
        ResultSet rs = db.selectQuery("select * from users where username ='" + userName + "' and password='" + password + "'");
        try {
            while (rs.next()) {
                status ++;
            }
        } catch (SQLException ex) {
            log.info(" getUser: " +  ex.getMessage());
        }
        
        return status;

    }


    public static void updateUser(DBConnection db,String userName, String password){
                db.connect();
                db.updateQuery("update users set password = '" + password + "' where username='" +userName + "'" );
    }


    public static void main(String [] argv){

        DBConnection db = new DBConnection();
        updateUser(db, "nandu" , "singh");


    }


}
