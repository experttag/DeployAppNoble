/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.noble.admin.action;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;
import org.apache.struts.upload.FormFile;

/**
 *
 * @author home
 */
public class ProductActionForm extends org.apache.struts.action.ActionForm {

    private int productId;
    private String productname;
    private String productdescription;
    private FormFile productImage;
    private int prodCategoryId;
    private int productprice;
    private int newArrivalInd;
    private String method;

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }
    

    public String getMethod() {
        return method;
    }

    public void setMethod(String method) {
        this.method = method;
    }

    public int getNewArrivalInd() {
        return newArrivalInd;
    }

    public void setNewArrivalInd(int newArrivalInd) {
        this.newArrivalInd = newArrivalInd;
    }

    public int getProdCategoryId() {
        return prodCategoryId;
    }

    public void setProdCategoryId(int prodCategoryId) {
        this.prodCategoryId = prodCategoryId;
    }

    public FormFile getProductImage() {
        return productImage;
    }

    public void setProductImage(FormFile productImage) {
        this.productImage = productImage;
    }

    public String getProductdescription() {
        return productdescription;
    }

    public void setProductdescription(String productdescription) {
        this.productdescription = productdescription;
    }

    public String getProductname() {
        return productname;
    }

    public void setProductname(String productname) {
        this.productname = productname;
    }

    public int getProductprice() {
        return productprice;
    }

    public void setProductprice(int productprice) {
        this.productprice = productprice;
    }



    

  
    /**
     *
     */
    public ProductActionForm() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * This is the action called from the Struts framework.
     * @param mapping The ActionMapping used to select this instance.
     * @param request The HTTP Request we are processing.
     * @return
     */
    public ActionErrors validate(ActionMapping mapping, HttpServletRequest request) {
        ActionErrors errors = new ActionErrors();
        
        return errors;
    }
}
