
package com.noble.dao;

import com.noble.admin.dao.ProductDAO;
import com.noble.admin.database.DBConnection;
import com.noble.constant.DataConstant;
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


    /**
     * this method will select products based on given price and category
     * @param database
     * @param price
     * @param categoryId
     * @return
     */
    public static ArrayList getProduct(DBConnection database , String price, String categoryId){

        StringBuffer sql = new StringBuffer();
        String prefix=" where ";

        if(categoryId!=null&&!categoryId.equalsIgnoreCase(DataConstant.CATEGORY_ALL+"")){
            sql.append(prefix).append(" prod.prodCategoryId =").append(categoryId) ;
            prefix=" and ";
        } 

        if(price!=null&&!price.equalsIgnoreCase(DataConstant.RANGE_ALL+""))
            sql.append(prefix).append(" prod.productPrice <").append(price) ;

        

         return ProductDAO.getProducts(database, sql.toString());
    }

}
