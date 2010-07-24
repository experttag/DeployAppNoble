/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.noble.admin.utility;


import java.util.ArrayList;
import java.util.StringTokenizer;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.servlet.ServletContextEvent;
import javax.servlet.http.HttpServletRequest;

/**
 * This class will contain helper methods for string to and from conversion
 * @author NANDUS
 */
public class StringHelper {


    /**
     * This method will create a string of records separates by ',' from data from
     * arraylist
     * @param al
     * @return
     */
    public static String listToString(ArrayList al){

    String list = "";

    if(al.size()>0)
        list = list + al.get(0);

    for(int i=1;i<al.size();i++){
        list = list + "," + al.get(i);
    }

    return list;
    }


    /**
     * This method truncates string to a particular length
     * @param string
     * @param length size to which new string required
     * @return truncated string
     */
    public static String truncatString(String string,int length){

    if(string==null)
        return "";

    if(string.length()<length)
        return string;

    return string.substring(0, length);

    }


    /**
     * THis method will create an URL for for inviting friends
     * @param path
     * @param customerId
     * @return invite url
     */

    public static String getBaseUrl(HttpServletRequest request) {

        StringBuffer baseUrl = new StringBuffer();

        baseUrl.append("http://").append(request.getServerName())
                .append(":").append(request.getServerPort()).append(request.getContextPath())
                .append("/");

        return baseUrl.toString();
        
        //return "http://www.artsansar.com/";
    }


/**
     * This method returns real path of web application root folder
     * @param sce
     * @return
     */
    public static String getRealPath(ServletContextEvent sce){

        return sce.getServletContext().getRealPath("/");
    }




    /**
     * this method will remove all special characters
     * @param orig
     * @return
     */
    public static String removeSpecialCharacters(String orig)
      {
            if(orig==null)
                return "";
            else{
                // replacing with space allows the camelcase to work a little better in most cases.
                orig.replace('\\',' ');
                orig.replace('(',' ');
                orig.replace(')',' ');
                orig.replace('/',' ');
                orig.replace('-',' ');
                orig.replace(',',' ');
                orig.replace('>',' ');
                orig.replace('<',' ');
                orig.replace('-',' ');
                orig.replace('&',' ');

                // single quotes shouldn't result in CamelCase variables like Patient's -> PatientS
                // "smart" forward quote
                orig.replace("'","");

                
                orig.replace("\u2019",""); // smart forward (possessive) quote.

                // make sure to get rid of double spaces.
                orig.replace("   "," ");
                orig.replace("  "," ");

                orig.trim(); // Remove leading and trailing spaces.

                return(orig);
            }
      }


    /**
     * This method will change special characters to coded characters
     * @param orig
     * @return
     */
    public static String specialCharacterToCodedCharacter(String orig)
      {
            if(orig==null)
                return "";
            else{                
                // replacing with space allows the camelcase to work a little better in most cases.
                return orig.replace('\'','Â');
            }
      }

    /**
     * This method will  coded characters to change special characters
     * @param orig
     * @return
     */
    public static String codedCharacterToSpecialCharacter(String orig)
      {
            if(orig==null)
                return "";
            else{
                // replacing with space allows the camelcase to work a little better in most cases.
                return orig.replace('Â','\'');
            }
      }

    public static String parseOrder(String orderdata){

        if(orderdata==null||orderdata.equalsIgnoreCase(""))
            return "";
        
        StringBuffer data = new StringBuffer("<table>");
        StringTokenizer st_outer = new StringTokenizer(orderdata,"||");
        StringTokenizer st_inner = null;
        int i =0,j=0;

        for(j=0;j<st_outer.countTokens();j++){
            data.append("<tr>");
            st_inner = new StringTokenizer(st_outer.nextToken(),"::");
            
            for(i=0; i<st_inner.countTokens();i++){
                if(i==0)
                    data.append("<td>").append(st_inner.nextToken()).append(" (");
                if(i==1)
                    data.append(st_inner.nextToken()).append(")</td>");
                
            }
            data.append("</tr>");
        }
        data.append("</table>");

        return data.toString();
    }


    public static String parseAddress(String orderdata){

        if(orderdata==null||orderdata.equalsIgnoreCase(""))
            return "";

        StringBuffer data = new StringBuffer("<table>");
        StringTokenizer st_outer = new StringTokenizer(orderdata,"||");        
        int j=0,noTokens=0;

        noTokens=st_outer.countTokens();

        for(j=0;j<noTokens;j++){
            data.append("<tr>");
            data.append("<td>").append(st_outer.nextToken()).append("</td>");
            data.append("</tr>");
        }
        data.append("</table>");

        return data.toString();
    }

}
