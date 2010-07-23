/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.noble.admin.dao;

import com.noble.admin.database.DBConnection;
import com.noble.admin.modal.IntStringPair;
import com.noble.admin.utility.ParseData;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import org.apache.log4j.Logger;

/**
 *
 * @author home
 */
public class CategoryDAO {

    private static Logger log = Logger.getLogger(CategoryDAO.class);

    public static void addCategory(DBConnection db,String categoryName){

        log.info(" addCategory");
                db.connect();
                db.updateQuery("insert into category (prodCategoryName) values( '" + categoryName +"')");
    }


    public static void removeCategory(DBConnection db,String categoryId){
        log.info(" removeCategory");
                db.connect();
                db.updateQuery("delete from category where prodCategoryId=" + categoryId );
    }


    public static ArrayList  getAllCategory(DBConnection db){

        log.info(" getAllCategory: retrieving category");

        ArrayList priceranges =  new ArrayList();
        IntStringPair  range = null;

        db.connect();
        ResultSet rs = db.selectQuery("select * from category ");
        try {
            while (rs.next()) { 

                range = new IntStringPair();
                range.setId(ParseData.parseInt(rs.getString(1)));
                range.setValue(ParseData.parseString(rs.getString(2)));

                priceranges.add(range);

            }
        } catch (SQLException ex) {
            log.info(" getAllCategory: " +  ex.getMessage());
        }

        return priceranges;

    }



    public static void main(String [] argv){

        DBConnection db = new DBConnection();
        removeCategory(db, "4");


    }
    

}
