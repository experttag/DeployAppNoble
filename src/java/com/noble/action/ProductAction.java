/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.noble.action;

import com.noble.admin.dao.CategoryDAO;
import com.noble.admin.dao.PriceRangeDAO;
import com.noble.admin.dao.UploadDAO;
import com.noble.admin.database.DBConnection;
import com.noble.admin.utility.ParseData;
import com.noble.dao.ViewProductDAO;
import java.util.ArrayList;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.apache.struts.actions.DispatchAction;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionForward;

/**
 *
 * @author home
 */
public class ProductAction extends DispatchAction {
    
    private  DBConnection database = null;
    private static Logger log = Logger.getLogger(ProductAction.class);
    


    /**
     * This method loades initial data while uses visits home paage
     * @param mapping
     * @param form
     * @param request
     * @param response
     * @return
     * @throws java.lang.Exception
     */
    public ActionForward reloadproducts(ActionMapping mapping, ActionForm  form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {

        log.info("reloadproducts");

        database = new DBConnection();
        request.getSession().setAttribute("priceranges", PriceRangeDAO.getRange(database));
        request.getSession().setAttribute("categories", CategoryDAO.getAllCategory(database));
        request.getSession().setAttribute("offer", UploadDAO.getOffer(database));

        request.getSession().setAttribute("reloaded", "yes");
        
        database.close();

        return mapping.findForward("home");
    }


    
    /**
     * This method reload products based on given price range
     * @param mapping
     * @param form
     * @param request
     * @param response
     * @return
     * @throws java.lang.Exception
     */
    public ActionForward byprice(ActionMapping mapping, ActionForm  form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        
        log.info("byprice");
        database = new DBConnection();

        //retrieve range from database and see if its valid
        String range = request.getParameter("range");
        if(!ParseData.isValidString(range))  range=null ;

        //retrieve categoyy from database and see if its valid
        String categoryId = request.getParameter("categoryId");
        //String categoryIdName = request.getParameter("categoryIdName");
        if(!ParseData.isValidString(categoryId)){
            categoryId=null ;
            //categoryIdName="All categories";
        }

        //retrieve current category and range from session
        String currentcategoryId = (String)request.getSession().getAttribute("currentcategoryId");
        String currentrange = (String)request.getSession().getAttribute("currentrange");
        //String currentcategory = (String)request.getSession().getAttribute("currentcategory");

        //use current range or category from session if incomming range is null
        if(range==null)         range = currentrange;
        if(categoryId==null){ 
            categoryId = currentcategoryId; 
            //categoryIdName=currentcategory ;
        }


        ArrayList products = ViewProductDAO.getProduct(database, range,categoryId);

        request.setAttribute("products", products);
        
        //request.getSession().setAttribute("priceranges", PriceRangeDAO.getRange(database));
        //request.getSession().setAttribute("categories", CategoryDAO.getAllCategory(database));

        //request.getSession().setAttribute("currentcategory", categoryIdName);
        request.getSession().setAttribute("currentcategoryId", categoryId);
        request.getSession().setAttribute("currentrange", range);

        database.close();
        return mapping.findForward("productbyprice");
    }


    /**
     * This method reload products based on given product category
     * @param mapping
     * @param form
     * @param request
     * @param response
     * @return
     * @throws java.lang.Exception
     */
    public ActionForward bycategory(ActionMapping mapping, ActionForm  form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {

       return byprice(mapping, form, request, response);
        
    }
}