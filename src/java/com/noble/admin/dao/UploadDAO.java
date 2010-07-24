/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.noble.admin.dao;

import com.noble.admin.database.DBConnection;
import com.noble.admin.utility.ParseData;
import java.sql.ResultSet;
import java.sql.SQLException;
import org.apache.log4j.Logger;

/**
 *
 * @author home
 */
public class UploadDAO {

    private static Logger log = Logger.getLogger(UploadDAO.class);

    public static void addOffer(DBConnection db, String offerdetail, String fileName) {
        log.info("addOffer");

         StringBuffer sql = new StringBuffer();

                sql.append(" insert into offers (offerdetails,offerfile,offerdate) values ('")
                        .append(offerdetail).append("','")
                        .append(fileName).append("',")
                        .append("CURDATE()").append(")");
                db.connect();
                db.updateQuery(sql.toString());
    }



    public static String getOffer(DBConnection db){

        log.info("getOffer");
        String offerFile="";

        try {

            //System.out.println(" query --->" + sql.toString());
            db.connect();
            ResultSet rs = db.selectQuery(" select * from offers order by offerdate desc");

            while (rs.next()) {

                offerFile = ParseData.parseString(rs.getString(""));
                break;
            }

        } catch (SQLException ex) {
            log.info("getProducts : " +  ex.getMessage());
        }

        return offerFile;
    }

    

}
