/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.noble.admin.constant;

/**
 *
 * @author home
 */
public class DBConstant {

    
    public static final String databaseDriver="com.mysql.jdbc.Driver"; //driver used
    public static  String databaseURL="jdbc:mysql://localhost:3306/artsansa_noble";
    public static  String databaseUserName="artsansa_noble"; //home
    public static  String databasePasswordName="artsansa_noble";

    //name of database pool to be created ad used in getting conections
    public static final String databaseName = "NoblePool";

    //the database pool configuration file to be used by smartpool to create connections
    public static final String databasePoolConfigFile = "\\WEB-INF\\smartpool\\pool-config.xml";
}
