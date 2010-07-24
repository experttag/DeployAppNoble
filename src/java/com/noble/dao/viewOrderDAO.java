/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.noble.dao;

import com.noble.action.CheckOutActionForm;
import com.noble.admin.dao.OrderDAO;
import com.noble.admin.database.DBConnection;

/**
 *
 * @author home
 */
public class viewOrderDAO {


    /**
     * the method will create insert query for adding order data to database
     * @param db
     * @param order
     */
    public static void addOrder(DBConnection db,CheckOutActionForm order){
        
        StringBuffer data = new StringBuffer();

        if(order!=null){

            data.append("'").append(order.getImOrderNo()).append("',");
            data.append("'").append(order.getImUserData()).append("',");
            data.append("'").append(order.getImOrderData()).append("',");
            data.append("'").append(order.getImUserMail()).append("'");

            OrderDAO.addOrder(db, data.toString());

        }
    }

}
