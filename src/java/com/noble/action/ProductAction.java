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
        String range = request.getParameter("range");
        if(!ParseData.isValidString(range))  range=null ;

        ArrayList products = ViewProductDAO.getProductbyPrice(database, range);

        request.getSession().setAttribute("products", products);
        request.getSession().setAttribute("currentrange", range);

        request.getSession().setAttribute("priceranges", PriceRangeDAO.getRange(database));
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

        database = new DBConnection();
        log.info("bycategory");
        String categoryId = request.getParameter("categoryId");
        String categoryIdName = request.getParameter("categoryIdName");

        if(!ParseData.isValidString(categoryId)){
            categoryId=null ;
            categoryIdName="All categories";
        }

        ArrayList products = ViewProductDAO.getProductbyCategory(database, categoryId);

        request.getSession().setAttribute("products", products);
        request.getSession().setAttribute("currentcategory", categoryIdName);

        request.getSession().setAttribute("categories", CategoryDAO.getAllCategory(database));
        database.close();
        return mapping.findForward("productbycategory");
    }
}