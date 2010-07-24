/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.noble.admin.action;

import com.noble.admin.dao.OrderDAO;
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
public class AdminOrderAction extends DispatchAction {
    
     private  DBConnection database = null;
    private static Logger log = Logger.getLogger(AdminOrderAction.class);
    
    
    public ActionForward showorders(ActionMapping mapping, ActionForm  form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {

        log.info("addcategory");
        database = new DBConnection();
        request.getSession().setAttribute("orders", OrderDAO.getAllOrders(database));
        database.close();
        return mapping.findForward("orders");
    }



    public ActionForward myAction2(ActionMapping mapping, ActionForm  form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {

        log.info("addcategory");
        database = new DBConnection();

        database.close();
        return mapping.findForward("orders");
    }
}