
package com.noble.admin.action;

import com.noble.admin.constant.ConfigConstant;
import com.noble.admin.dao.CategoryDAO;
import com.noble.admin.dao.PriceRangeDAO;
import com.noble.admin.dao.PropertiesDAO;
import com.noble.admin.dao.UserDAO;
import com.noble.admin.database.DBConnection;
import java.util.Properties;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.actions.DispatchAction;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionForward;

/**
 *
 * @author NANDUS
 */
public class AdminLoginAction extends DispatchAction {
    
    private static DBConnection database = new DBConnection();

    
    
    public ActionForward login(ActionMapping mapping, ActionForm  form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {

        String username = request.getParameter("username");
        String userpassword = request.getParameter("userpassword");

        if(UserDAO.getUser(database, username, userpassword)>0){
            
            request.getSession().setAttribute("username", username);
            request.getSession().setAttribute("priceranges", PriceRangeDAO.getRange(database));
            request.getSession().setAttribute("categories", CategoryDAO.getAllCategory(database));

            Properties fileconfig = (new PropertiesDAO(ConfigConstant.FILE_CONFIG)).getFile();
            request.getSession().setAttribute("fileconfig", fileconfig);
            
            return mapping.findForward("admin");
        }
        else
            return mapping.findForward("login");
    }

    
    public ActionForward logout(ActionMapping mapping, ActionForm  form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        
        request.getSession().invalidate();
        return mapping.findForward("login");
    }
}