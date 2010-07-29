/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.noble.action;

import com.noble.communication.mail.MailHelper;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.actions.DispatchAction;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionForward;

/**
 *
 * @author home
 */
public class MailAction extends DispatchAction {
    
       
    public ActionForward feedback(ActionMapping mapping, ActionForm  form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {

        MailActionForm mail = (MailActionForm)form;

        MailHelper.sendMail(mail.getMail_email(),mail.getMail_subject(),mail.getMail_body());
        request.setAttribute("message", "Feedback has been submitted successfully. <br><br> Thanks you");
        
        return mapping.findForward("confirmation");
    }


    public ActionForward enquiry(ActionMapping mapping, ActionForm  form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {

        String item_id = request.getParameter("item_id");
        String inq_name = request.getParameter("inq_name");
        String inq_email = request.getParameter("inq_email");
        String inq_phone = request.getParameter("inq_phone");
        String inq_city = request.getParameter("inq_city");
        String inq_state = request.getParameter("inq_state");
        String inq_ques = request.getParameter("inq_ques");

        MailHelper.sendMail(item_id,inq_name,inq_email,inq_phone,inq_city,inq_state,inq_ques);
        request.setAttribute("message", "Enquiry has been submitted successfully. <br><br> Thanks you");

        return mapping.findForward("confirmation");
    }
}