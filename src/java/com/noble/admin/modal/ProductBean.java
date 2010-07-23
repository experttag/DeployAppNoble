

package com.noble.admin.modal;

/**
 * This class will hold data for a given product
 * @author home
 */
public class ProductBean {

    private  int productId;
    private  String productName;
    private  String productDescription;
    private  int productPrice;
    private  int prodCategoryId;
    private  String prodCategoryName;
    private  String productImage;
    private  int newArrivalInd;

    public String getProdCategoryName() {
        return prodCategoryName;
    }

    public void setProdCategoryName(String prodCategoryName) {
        this.prodCategoryName = prodCategoryName;
    }


    
    public  int isNewArrivalInd() {
        return newArrivalInd;
    }

    public  void setNewArrivalInd(int newArrivalInd) {
        this.newArrivalInd = newArrivalInd;
    }

    public  int getProdCategoryId() {
        return prodCategoryId;
    }

    public  void setProdCategoryId(int prodCategoryId) {
        this.prodCategoryId = prodCategoryId;
    }

    public  String getProductDescription() {
        return productDescription;
    }

    public  void setProductDescription(String productDescription) {
        this.productDescription = productDescription;
    }

    public  int getProductId() {
        return productId;
    }

    public  void setProductId(int productId) {
        this.productId = productId;
    }

    public  String getProductImage() {
        return productImage;
    }

    public  void setProductImage(String productImage) {
        this.productImage = productImage;
    }

    public  int getProductPrice() {
        return productPrice;
    }

    public  void setProductPrice(int productPrice) {
        this.productPrice = productPrice;
    }

    public  String getProductName() {
        return productName;
    }

    public  void setProductName(String produnctName) {
        this.productName = produnctName;
    }


    


}
