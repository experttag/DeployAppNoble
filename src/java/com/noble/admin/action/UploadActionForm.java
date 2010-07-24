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
public class UploadActionForm extends org.apache.struts.action.ActionForm {
    
    private String offerdetail;
    private FormFile productImage;

    public String getOfferdetail() {
        return offerdetail;
    }

    public void setOfferdetail(String offerdetail) {
        this.offerdetail = offerdetail;
    }

    public FormFile getProductImage() {
        return productImage;
    }

    public void setProductImage(FormFile productImage) {
        this.productImage = productImage;
    }



    /**
     *
     */
    public UploadActionForm() {
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
