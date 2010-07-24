package com.noble.admin.database;

import com.noble.admin.constant.DBConstant;
import com.noble.admin.utility.StringHelper;
import org.apache.log4j.Logger;
import org.smartlib.pool.core.ConnectionPoolException;
import org.smartlib.pool.core.SmartPoolFactory;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;


/**
 * This listener class will create a connection pool and store it in context session
 * @author NANDUS
 */
public class PoolingListener implements ServletContextListener{

    private static Logger log = Logger.getLogger(PoolingListener.class);

    public void contextInitialized(ServletContextEvent sce) {


        //Start : creating database pool for mysql using smart pool
        try {
            log.info("Start : database pool creation");
            SmartPoolFactory smp = new SmartPoolFactory( StringHelper.getRealPath(sce)+ DBConstant.databasePoolConfigFile);
            log.info("End : database pool creation");

        } catch (ConnectionPoolException ex) {
            log.fatal("database pool creation - " + ex);

        }
        //End : creating database pool for mysql using smart pool



    }
 
    public void contextDestroyed(ServletContextEvent  sce){

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