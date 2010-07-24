/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.noble.action;

import com.noble.admin.database.DBConnection;
import com.noble.communication.mail.MailHelper;
import com.noble.dao.viewOrderDAO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionForward;

/**
 *
 * @author home
 */
public class CheckoutAction extends org.apache.struts.action.Action {

    private  DBConnection database = null;
    private static Logger log = Logger.getLogger(CheckoutAction.class);
        
    /**
     * This is the action called from the Struts framework.
     * @param mapping The ActionMapping used to select this instance.
     * @param form The optional ActionForm bean for this request.
     * @param request The HTTP Request we are processing.
     * @param response The HTTP Response we are processing.
     * @throws java.lang.Exception
     * @return
     */
    public ActionForward execute(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {

        CheckOutActionForm order = (CheckOutActionForm)form;
        database = new DBConnection();
        viewOrderDAO.addOrder(database, order);

        MailHelper.sendMail(order);

        request.getSession().setAttribute("orderNo", order.getImOrderNo());
        database.close();
        return mapping.findForward("orderconfirmation");
    }
}
