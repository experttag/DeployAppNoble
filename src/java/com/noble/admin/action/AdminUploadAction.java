/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.noble.admin.action;

import com.noble.admin.dao.UploadDAO;
import com.noble.admin.database.DBConnection;
import com.noble.admin.utility.FileUpload;
import java.util.Properties;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.apache.struts.actions.DispatchAction;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionForward;
import org.apache.struts.upload.FormFile;

/**
 *
 * @author home
 */
public class AdminUploadAction extends DispatchAction {

    private  DBConnection database = null;
    private static Logger log = Logger.getLogger(AdminUploadAction.class);
    
    public ActionForward banner(ActionMapping mapping, ActionForm  form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {

        log.info("addproduct");
        database = new DBConnection();

        UploadActionForm product = (UploadActionForm)form;
        FormFile productImage =product.getProductImage();

        //add product to database
        
         Properties fileconfig = (Properties)(request.getSession().getAttribute("fileconfig"));

        //save product image
        if(FileUpload.isValidFile(productImage)&&fileconfig!=null){
           UploadDAO.addOffer(database, product.getOfferdetail(),productImage.getFileName());

        FileUpload.saveFile(productImage, request.getRealPath("/") +"files/" );
        //FileUpload.saveFile(productImage,fileconfig.getProperty("file_root"));

        request.getSession().setAttribute("offer",productImage.getFileName()) ;

        }


        request.getSession().setAttribute("message","offer has been added successfully") ;

        database.close();

        return mapping.findForward("uploadoffer");
    }

    
    public ActionForward myAction2(ActionMapping mapping, ActionForm  form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        
        return mapping.findForward("uploadoffer");
    }
}