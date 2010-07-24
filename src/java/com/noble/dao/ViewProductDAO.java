
package com.noble.dao;

import com.noble.admin.dao.ProductDAO;
import com.noble.admin.database.DBConnection;
import java.util.ArrayList;


public class ViewProductDAO {


    /**
     * this method will return products based on price
     * @param database
     * @param price
     * @return list of products
     */
    public static ArrayList getProductbyPrice(DBConnection database , String price){
        if(price==null)
            return ProductDAO.getProducts(database, "");
        else
            return ProductDAO.getProducts(database, " where prod.productPrice < " + price);
    }


    /**
     * this method will return products based on given category
     * @param database
     * @param categoryId
     * @return list of productd
     */
    public static ArrayList getProductbyCategory(DBConnection database , String categoryId){
        if(categoryId==null)
            return ProductDAO.getProducts(database, "");
        else
            return ProductDAO.getProducts(database, " where prod.prodCategoryId = " + categoryId);
    }

}
