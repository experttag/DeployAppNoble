/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.noble.admin.dao;

import com.noble.admin.database.DBConnection;
import com.noble.admin.modal.OrderBean;
import com.noble.admin.utility.ParseData;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import org.apache.log4j.Logger;

/**
 *
 * @author home
 */
public class OrderDAO {

    private static Logger log = Logger.getLogger(OrderDAO.class);


    /**
     * this method insert order data to database in fromat orderid,userdata,orderdata,usermail
     * @param db
     * @param data
     */
    public static void addOrder(DBConnection db,String data){

        log.info(" addOrder");
                db.connect();
                db.updateQuery("insert into orders (orderid,userdata,orderdata,usermail , orderdate) values( " + data +",CURDATE())");
    }


    /**
     * This method will remove order based on given order id
     * @param db
     * @param orderId
     */
    public static void removeOrder(DBConnection db,String orderId){
        log.info(" removeOrder");
                db.connect();
                db.updateQuery("delete from orders where orderid=" + orderId );
    }


    /**
     * This method will return list orders based on given condition
     * @param db
     * @param condition
     * @return list of order
     */
    public static ArrayList  getOrders(DBConnection db , String condition){

        log.info(" getOrders");

        ArrayList orders =  new ArrayList();
        OrderBean  order = null;

        db.connect();
        ResultSet rs = db.selectQuery("select orderid,userdata,orderdata,usermail from orders " + condition + " order by orderdate desc");
        try {
            while (rs.next()) {

                order = new OrderBean();

                order.setOrderNo(ParseData.parseString(rs.getString("orderid")));
                order.setUserData(ParseData.parseString(rs.getString("userdata")));
                order.setOrderData(ParseData.parseString(rs.getString("orderdata")));
                order.setUserMail(ParseData.parseString(rs.getString("usermail")));
                
                orders.add(order);

            }
        } catch (SQLException ex) {
            log.info(" getOrders: " +  ex.getMessage());
        }

        return orders;

    }


    /**
     * This method will return list of all orders stored in database
     * @param db
     * @return list of all orders
     */
        public static ArrayList  getAllOrders(DBConnection db){
            return getOrders(db,"");
        }


    public static void main(String [] argv){

        DBConnection db = new DBConnection();
        getOrders(db, "");


    }


}
