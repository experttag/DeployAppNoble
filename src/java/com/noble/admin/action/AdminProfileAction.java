/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.noble.admin.action;

import com.noble.admin.dao.UserDAO;
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
public class AdminProfileAction extends DispatchAction {
    
    private  DBConnection database = null;
    private static Logger log = Logger.getLogger(AdminProfileAction.class);

    
    
    public ActionForward updateprofile(ActionMapping mapping, ActionForm  form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        database = new DBConnection();
        log.info("updateprofile"); 
        String password = request.getParameter("password");
        String username = request.getParameter("username");

        UserDAO.updateUser(database, username, password);
        request.getSession().setAttribute("message","profile has been updated successfully") ;
        database.close();
        return mapping.findForward("admin");
    }

    
    public ActionForward removeprofile(ActionMapping mapping, ActionForm  form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        
        log.info("removeprofile");
        database = new DBConnection();

        database.close();
        return mapping.findForward("admin");
    }
}