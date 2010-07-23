/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.noble.admin.dao;

import com.noble.admin.database.DBConnection;
import com.noble.admin.modal.IntPair;
import com.noble.admin.utility.ParseData;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import org.apache.log4j.Logger;



/**
 *
 * @author home
 */
public class PriceRangeDAO {

    private static Logger log = Logger.getLogger(PriceRangeDAO.class);

    public static void addRange(DBConnection db,String range){
                log.info(" adding price range");
                db.connect();
                db.updateQuery("insert into pricerange (rangevalue) values(" + range +")");
    }


    public static void removeRange(DBConnection db,String rangeId){
                log.info(" removing price range");
                db.connect();
                db.updateQuery("delete from pricerange where rangeId=" + rangeId );
    }


    public static ArrayList  getRange(DBConnection db){

        log.info(" getRange: retrieving range");
        
        ArrayList priceranges =  new ArrayList();
        IntPair  range = null;

        db.connect();
        ResultSet rs = db.selectQuery("select * from pricerange ");
        try {
            while (rs.next()) {

                range = new IntPair();
                range.setId(ParseData.parseInt(rs.getString("rangeId")));
                range.setValue(ParseData.parseInt(rs.getString("rangevalue")));

                priceranges.add(range); 

            }
        } catch (SQLException ex) {
            log.info(" getRange: " +  ex.getMessage());
        }

        return priceranges;

    }


    public static void main(String [] argv){

        DBConnection db = new DBConnection();
        removeRange(db, "4");


    }


}
