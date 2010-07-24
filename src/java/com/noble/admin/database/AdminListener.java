/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.noble.admin.database;

import com.noble.admin.constant.DBConstant;
import com.noble.admin.utility.StringHelper;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import org.apache.log4j.Logger;
import org.smartlib.pool.core.ConnectionPoolException;
import org.smartlib.pool.core.SmartPoolFactory;

/**
 * Web application lifecycle listener.
 * @author home
 */

public class AdminListener implements ServletContextListener {

    private static Logger log = Logger.getLogger(PoolingListener.class);

    public void contextInitialized(ServletContextEvent arg0) {
        //Start : creating database pool for mysql using smart pool
        try {
            log.info("Start : database pool creation");
            SmartPoolFactory smp = new SmartPoolFactory(StringHelper.getRealPath(arg0)+ DBConstant.databasePoolConfigFile);
            log.info("End : database pool creation");

        } catch (ConnectionPoolException ex) {
            log.fatal("database pool creation - " + ex);

        }
        //End : creating database pool for mysql using smart pool

    }

    public void contextDestroyed(ServletContextEvent arg0) {
        //Start : shutting down database pool
        log.info("Start : database shutdown ");
        try{
        SmartPoolFactory.shutDown();
        }
        catch(Exception ex){
            log.fatal("Exception while database shutdown : " + ex);
        }
        log.info("End : database shutdown ");
       //End : shutting down database pool
    
    }
}