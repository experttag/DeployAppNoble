/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.noble.admin.database;

import com.noble.admin.constant.DBConstant;
import connectionpool.ConnectionPoolException;
import connectionpool.SmartPoolFactory;
import java.sql.Connection;
import java.util.logging.Level;
import org.apache.log4j.Logger;

/**
 *
 * @author NANDUS
 */
public class DatabaseManager {

    private static Logger log = Logger.getLogger(DatabaseManager.class);

    /**
     * This method rtrieves a new connection from database pool and return connection
     * @return
     */
    public static Connection getConnection(){

        java.sql.Connection con =null;
        try {
            log.info("Start : new database connection ");
            con = SmartPoolFactory.getConnection(DBConstant.databaseName);
            //log.info("End : new database connection ");
        } catch (ConnectionPoolException ex) {
            log.fatal("new database connection  - " + ex);            
        }
        return con;
    }

}
