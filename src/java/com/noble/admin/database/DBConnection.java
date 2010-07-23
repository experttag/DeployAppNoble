package com.noble.admin.database;

import com.noble.admin.constant.DBConstant;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;
import java.sql.ResultSet;
import org.apache.log4j.Logger;


public class DBConnection{

    private static Logger log = Logger.getLogger(DBConnection.class);
	
	String DBUrl, DBUser, DBPass, SQLQuery;
    Connection conn;
    Statement stmt;
    ResultSet result;	
	
	public DBConnection(String DBUrl, String DBUser, String DBPass){
    	this.DBUrl = DBUrl;
        this.DBUser = DBUser;
        this.DBPass = DBPass;
        try {
        	Class.forName(DBConstant.databaseDriver);
        }catch(Exception e){
            log.error("Error while DBConection :" + e.getMessage());
        }
    }

    public DBConnection(){
    	this.DBUrl = DBConstant.databaseURL;
        this.DBUser = DBConstant.databaseUserName;
        this.DBPass = DBConstant.databasePasswordName;
        try {
        	Class.forName(DBConstant.databaseDriver);
        }catch(Exception e){
        log.error("Error while DBConection :" + e.getMessage());
        }
    }

	
	public void connect() {
    	try {
        	conn = DriverManager.getConnection(DBUrl + "?user=" + DBUser + "&password=" + DBPass);
        }catch(Exception e){
        log.error("Error while connect :" + e.getMessage());
        }
    }
	
    public ResultSet selectQuery(String SQLQuery){
    	this.SQLQuery = SQLQuery;

        try {
        	stmt = conn.createStatement();
            result = stmt.executeQuery( SQLQuery );
        }
        catch( Exception e ){
        log.error("Error while selectQuery :" + e.getMessage());
        }
    	return result;
    }
    
    public void query(String SQLQuery){
    	this.SQLQuery = SQLQuery;
        try {
        	stmt = conn.createStatement();
            stmt.executeQuery( SQLQuery );
        }
        catch( Exception e ){
        log.error("Error while query :" + e.getMessage());
        }
    }

    public void updateQuery(String SQLQuery){
    	this.SQLQuery = SQLQuery;
        try {
        	stmt = conn.createStatement();
            stmt.executeUpdate( SQLQuery );
        }
        catch( Exception e ){
        log.error("Error while updatequery :" + e.getMessage());
        }
    }


    
    public void close(){
    	try {
        	stmt.close();
            conn.close();
        }
        catch(Exception e){
        log.error("Error while close :" + e.getMessage());
        }
    }
}

