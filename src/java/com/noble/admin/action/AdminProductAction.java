/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.noble.admin.action;

import com.noble.admin.dao.ProductDAO;
import com.noble.admin.database.DBConnection;
import com.noble.admin.utility.FileUpload;
import java.util.ArrayList;
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
public class AdminProductAction extends DispatchAction {
    
   
    private static DBConnection database = new DBConnection();
    private static Logger log = Logger.getLogger(AdminProductAction.class);
    
    public ActionForward addproduct(ActionMapping mapping, ActionForm  form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {

        log.info("addproduct");
        ProductActionForm product = (ProductActionForm)form;
        FormFile productImage =product.getProductImage();

        //add product to database
        ProductDAO.addProduct(database, product.getProductname(),
                product.getProductdescription(),
                product.getProductprice(),
                product.getProdCategoryId(),
                productImage==null?"":productImage.getFileName() ,
                product.getNewArrivalInd());

         Properties fileconfig = (Properties)(request.getSession().getAttribute("fileconfig"));
         
        //save product image
        if(FileUpload.isValidFile(productImage)&&fileconfig!=null)
        FileUpload.saveFile(productImage,fileconfig.getProperty("file_root")); 

        request.getSession().setAttribute("message","product has been added successfully") ;


        return mapping.findForward("admin");
    }

    
    public ActionForward updateproduct(ActionMapping mapping, ActionForm  form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {

        log.info("updateproduct");
        ProductActionForm product = (ProductActionForm)form;
        FormFile productImage =product.getProductImage();

        //add product to database
        ProductDAO.updateProduct(database,
                product.getProductname(),
                product.getProductdescription(),
                product.getProductprice(),
                product.getProdCategoryId(),
                FileUpload.isValidFile(productImage)?productImage.getFileName():null ,
                product.getNewArrivalInd(),
                product.getProductId());

         Properties fileconfig = (Properties)(request.getSession().getAttribute("fileconfig"));

        //save product image
        if(FileUpload.isValidFile(productImage)&&fileconfig!=null)
        FileUpload.saveFile(productImage,fileconfig.getProperty("file_root"));

        request.getSession().setAttribute("message","product has been updated successfully") ;


        return mapping.findForward("admin");
        
    }


    public ActionForward removeproduct(ActionMapping mapping, ActionForm  form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {

        log.info("removeproduct");
        String productId = request.getParameter("productId");
        
        ProductDAO.removeProduct(database, productId);

        request.getSession().setAttribute("message","product has been removed successfully") ;
        return mapping.findForward("admin");
    }


    public ActionForward searchproduct(ActionMapping mapping, ActionForm  form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {

        log.info("searchproduct");
        ProductActionForm product = (ProductActionForm)form;
        ArrayList products = null;
        
        //add product to database
        products = ProductDAO.getProducts(database,
                product.getProductId(),
                product.getProductname(),
                product.getProductdescription(),
                product.getProdCategoryId());

        request.setAttribute("products",products) ;

        return mapping.findForward("findproduct");
    }

}