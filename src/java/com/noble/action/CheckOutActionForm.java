/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.noble.action;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;

/**
 *
 * @author home
 */
public class CheckOutActionForm extends org.apache.struts.action.ActionForm {
    
    private String imOrderNo;
    private String imUserData;
    private String imOrderData;
    private String imShipment;
    private String imUserMail;
    private String imLocale;

    public String getImLocale() {
        return imLocale;
    }

    public void setImLocale(String imLocale) {
        this.imLocale = imLocale;
    }

    public String getImOrderData() {
        return imOrderData;
    }

    public void setImOrderData(String imOrderData) {
        this.imOrderData = imOrderData;
    }

    public String getImOrderNo() {
        return imOrderNo;
    }

    public void setImOrderNo(String imOrderNo) {
        this.imOrderNo = imOrderNo;
    }

    public String getImShipment() {
        return imShipment;
    }

    public void setImShipment(String imShipment) {
        this.imShipment = imShipment;
    }

    public String getImUserData() {
        return imUserData;
    }

    public void setImUserData(String imUserData) {
        this.imUserData = imUserData;
    }

    public String getImUserMail() {
        return imUserMail;
    }

    public void setImUserMail(String imUserMail) {
        this.imUserMail = imUserMail;
    }



    /**
     *
     */
    public CheckOutActionForm() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * This is the action called from the Struts framework.
     * @param mapping The ActionMapping used to select this instance.
     * @param request The HTTP Request we are processing.
     * @return
     */
    public ActionErrors validate(ActionMapping mapping, HttpServletRequest request) {
        ActionErrors errors = new ActionErrors();
        return errors;
    }
}
