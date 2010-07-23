
package com.noble.admin.dao;


import com.noble.admin.database.DBConnection;
import com.noble.admin.modal.ProductBean;
import com.noble.admin.utility.ParseData;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import org.apache.log4j.Logger;

/**
 *
 * @author home
 */
public class ProductDAO {

    private static Logger log = Logger.getLogger(ProductDAO.class);

    public static void addProduct(DBConnection db,String prodName,String productDescription,int productPrice,int prodCategoryId,
            String productImage, int newArrivalInd){

        log.info("addProduct");

         StringBuffer sql = new StringBuffer();
                sql.append(" insert into products (prodName,prodDescription,productPrice,prodCategoryId,productImage,newArrivalInd ) values ('")
                        .append(prodName).append("','")
                        .append(productDescription).append("',")
                        .append(productPrice).append(",")
                        .append(prodCategoryId).append(",'")
                        .append(productImage).append("',")
                        .append(newArrivalInd).append(")");
                db.connect();
                db.updateQuery(sql.toString());
    }

    public static void removeProduct(DBConnection db,String productId){

                log.info("removeProduct");
                db.connect();
                db.updateQuery(" delete from products where prodId = " + productId);
    }

    public static void updateProduct(DBConnection db,String prodName,String productDescription,int productPrice,int prodCategoryId,
            String productImage, int newArrivalInd,int productId){

         log.info("updateProduct");

         StringBuffer sql = new StringBuffer();
                sql.append(" update products set ");

                sql.append(" prodName ='").append(prodName).append("', ");
                if(productDescription!=null)
                    sql.append(" prodDescription ='").append(productDescription).append("', ");
                if(productPrice>0)
                    sql.append(" productPrice =").append(productPrice).append(", ");
                if(prodCategoryId>0)
                    sql.append(" prodCategoryId =").append(prodCategoryId).append(", ");
                if(productImage!=null)
                    sql.append(" productImage ='").append(productImage).append("', ");
 
                sql.append(" newArrivalInd =").append(newArrivalInd).append(", ");

                  sql.append(" prodCategoryId =").append(prodCategoryId)
                     .append(" where prodId=").append(productId)     ;
                          

                db.connect();
                db.updateQuery(sql.toString());
    }
    

    
    public static ArrayList getProducts(DBConnection db , String condition){

        log.info("getProducts");

        ArrayList products = new ArrayList();
        ProductBean product = null;
        StringBuffer sql = new StringBuffer();
        try {

            sql.append("SELECT prod.prodId,prod.prodName,prod.prodDescription,prod.productPrice,prod.prodCategoryId, ")
                .append("prod.productImage,prod.newArrivalInd,cat.prodCategoryName ")
                .append(" FROM products prod Inner Join category cat ON prod.prodCategoryId = cat.prodCategoryId ")
                .append(condition==null?"":condition);
 
            db.connect();
            ResultSet rs = db.selectQuery(sql.toString()); 

            while (rs.next()) {

                product = new ProductBean();

                product.setProductId(ParseData.parseInt(rs.getString("prodId")));
                product.setProductPrice(ParseData.parseInt(rs.getString("productPrice")));
                product.setProdCategoryId(ParseData.parseInt(rs.getString("prodCategoryId")));
                product.setNewArrivalInd(ParseData.parseInt(rs.getString("newArrivalInd")));

                product.setProductName(ParseData.parseString(rs.getString("prodName")));
                product.setProductDescription(ParseData.parseString(rs.getString("prodDescription")));
                product.setProductImage(ParseData.parseString(rs.getString("productImage")));
                product.setProdCategoryName(ParseData.parseString(rs.getString("prodCategoryName")));
                System.out.println(product.getProductId());
                products.add(product);

            }

        } catch (SQLException ex) {
            log.info("getProducts : " +  ex.getMessage());
        }

        return products;
    }



    public static ArrayList getAllProducts(DBConnection db){
      return getProducts(db, null);
    }

    public static ArrayList getProduct(DBConnection db, String productId){
      return getProducts(db, " where productId=" + productId);
    }

    
    public static ArrayList getProducts(DBConnection db, int productId , String productName, String productDescription, int productCategory){

      StringBuffer sql = new StringBuffer();
      String prefix=" where ";

      if(productId>0){
          sql.append(prefix);
          sql.append(" prodId=").append(productId);
          prefix=" and ";
      }

      if(!ParseData.parseString(productName).equalsIgnoreCase("")){
          sql.append(prefix);
          sql.append(" prodName like '%").append(productName).append("%'");
          prefix=" and ";
      }

      if(!ParseData.parseString(productDescription).equalsIgnoreCase("")){
          sql.append(prefix);
          sql.append(" prodDescription like '%").append(productDescription).append("%'");
          prefix=" and ";
      }

      if(productCategory >0){
          sql.append(prefix);
          sql.append(" prod.prodCategoryId=").append(productCategory);
      }

      System.out.println(" sql --> " + sql.toString());

      return getProducts(db, sql.toString());
    }


        public static void main(String [] argv){

        DBConnection db = new DBConnection();
        getProducts(db,0,"","Door",1);


    }


}

