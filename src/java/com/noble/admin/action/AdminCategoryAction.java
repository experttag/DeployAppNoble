/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.noble.admin.action;

import com.noble.admin.dao.CategoryDAO;
import com.noble.admin.database.DBConnection;
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
public class AdminCategoryAction extends DispatchAction {
    
    private static DBConnection database = new DBConnection();
    private static Logger log = Logger.getLogger(AdminCategoryAction.class);
    
   
    public ActionForward addcategory(ActionMapping mapping, ActionForm  form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        log.info("addcategory");

        String categoryname = request.getParameter("categoryname");
        CategoryDAO.addCategory(database, categoryname);
        request.getSession().setAttribute("categories", CategoryDAO.getAllCategory(database));
        request.getSession().setAttribute("message","category has been added successfully") ;
        return mapping.findForward("admincategory");
    }

    
    public ActionForward deletecategory(ActionMapping mapping, ActionForm  form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        log.info("deletecategory");

        String categoryId = request.getParameter("categoryId");
        CategoryDAO.removeCategory(database, categoryId);
        request.getSession().setAttribute("categories", CategoryDAO.getAllCategory(database));
        request.getSession().setAttribute("message","category has been deleted successfully") ;
        return mapping.findForward("admincategory");
    }
}