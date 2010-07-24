/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.noble.admin.action;

import com.noble.admin.dao.PriceRangeDAO;
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
public class AdminRangeAction extends DispatchAction {
    
    private  DBConnection database = null;
    private static Logger log = Logger.getLogger(AdminRangeAction.class);


    public ActionForward addrange(ActionMapping mapping, ActionForm  form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        log.info("addcategory");
        database = new DBConnection();

        String rangevalue = request.getParameter("rangevalue");
        PriceRangeDAO.addRange(database, rangevalue);
        request.getSession().setAttribute("priceranges", PriceRangeDAO.getRange(database));
        request.getSession().setAttribute("message","range has been added successfully") ;

        database.close();
        return mapping.findForward("adminrange");
    }


    public ActionForward deleterange(ActionMapping mapping, ActionForm  form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        log.info("deletecategory");
        database = new DBConnection();

        String rangeId = request.getParameter("rangeId");
        PriceRangeDAO.removeRange(database, rangeId);
        request.getSession().setAttribute("priceranges", PriceRangeDAO.getRange(database));
        request.getSession().setAttribute("message","range has been deleted successfully") ;
        database.close();
        return mapping.findForward("adminrange");
    }
}