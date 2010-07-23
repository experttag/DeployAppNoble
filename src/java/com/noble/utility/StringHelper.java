/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.noble.utility;


import java.util.ArrayList;
import java.util.StringTokenizer;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
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
     * Following method validates incomming mail ids and return internet Address
     * associated with them.
     * @param recipients
     * @return List of internet addresses
     */
    public static InternetAddress[] scanMailId(String[] recipients){

    InternetAddress[] addressTo = new InternetAddress[recipients.length];

    for (int i = 0; i < recipients.length; )
    {
            try {
                addressTo[i] = new InternetAddress(recipients[i]);
                i++;
            } catch (AddressException ex) {
                System.out.println("following is Invalid mail Id");
            }
    }
        return addressTo;
    }


    /**
     * This method converts comma separated maillist provided by user into arraylist
     * @param mailList
     * @return array list of mail ids
     */
    public static String[] getMailIds(String mailList){

        String[] recipients;

        StringTokenizer st = new StringTokenizer(mailList, ",");
        
        recipients = new String[st.countTokens()];

        for(int i=0;st.hasMoreTokens();i++)
            recipients[i] = st.nextToken();

        return recipients;
    }


    /**
     * This method scans all mail id provided and return correct mailId list.
     * @param recipients
     * @return Array list of corrected mail ids
     */
    public static String[] scanCorrectMailIds(String[] recipients){
    
    String [] correctList;
    correctList = new String[recipients.length];

    for (int i = 0; i < recipients.length; )
    {
            try {
                new InternetAddress(recipients[i]);
                correctList[i] = recipients[i];
                i++;
            } catch (AddressException ex) {
                System.out.println("following is Invalid mail Id");
            }
    }
        return correctList;
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

 /**
  * This method will convert special characters in a string to html equilevent
  * @param s
  * @return string without special characters
  */
 /*
 public static final String escapeHTML(String s){
   StringBuffer sb = new StringBuffer();
   int n = s.length();
   for (int i = 0; i < n; i++) {
      char c = s.charAt(i);
      switch (c) {
         case '<': sb.append("&lt;"); break;
         case '>': sb.append("&gt;"); break;
         case '"': sb.append("&quot;"); break;
         case '': sb.append("&quot;"); break;
         case 'à': sb.append("&agrave;");break;
         case '&': sb.append("&amp;"); break;
          case 'À': sb.append("&Agrave;");break;
         case 'â': sb.append("&acirc;");break;
         case 'Â': sb.append("&Acirc;");break;
         case 'ä': sb.append("&auml;");break;
         case 'Ä': sb.append("&Auml;");break;
         case 'å': sb.append("&aring;");break;
         case 'Å': sb.append("&Aring;");break;
         case 'æ': sb.append("&aelig;");break;
         case 'Æ': sb.append("&AElig;");break;
         case 'ç': sb.append("&ccedil;");break;
         case 'Ç': sb.append("&Ccedil;");break;
         case 'é': sb.append("&eacute;");break;
         case 'É': sb.append("&Eacute;");break;
         case 'è': sb.append("&egrave;");break;
         case 'È': sb.append("&Egrave;");break;
         case 'ê': sb.append("&ecirc;");break;
         case 'Ê': sb.append("&Ecirc;");break;
         case 'ë': sb.append("&euml;");break;
         case 'Ë': sb.append("&Euml;");break;
         case 'ï': sb.append("&iuml;");break;
         case 'Ï': sb.append("&Iuml;");break;
         case 'ô': sb.append("&ocirc;");break;
         case 'Ô': sb.append("&Ocirc;");break;
         case 'ö': sb.append("&ouml;");break;
         case 'Ö': sb.append("&Ouml;");break;
         case 'ø': sb.append("&oslash;");break;
         case 'Ø': sb.append("&Oslash;");break;
         case 'ß': sb.append("&szlig;");break;
         case 'ù': sb.append("&ugrave;");break;
         case 'Ù': sb.append("&Ugrave;");break;
         case 'û': sb.append("&ucirc;");break;
         case 'Û': sb.append("&Ucirc;");break;
         case 'ü': sb.append("&uuml;");break;
         case 'Ü': sb.append("&Uuml;");break;
         case '®': sb.append("&reg;");break;
         case '©': sb.append("&copy;");break;
         case '€': sb.append("&euro;"); break;
         // be carefull with this one (non-breaking whitee space)
         case ' ': sb.append("&nbsp;");break;

         default:  sb.append(c); break;
      }
   }
   return sb.toString();
}
*/

/*
public static String stringToHTMLString(String string) {
    StringBuffer sb = new StringBuffer(string.length());
    // true if last char was blank
    boolean lastWasBlankChar = false;
    int len = string.length();
    char c;

    for (int i = 0; i < len; i++)
        {
        c = string.charAt(i);
        if (c == ' ') {
            // blank gets extra work,
            // this solves the problem you get if you replace all
            // blanks with &nbsp;, if you do that you loss
            // word breaking
            if (lastWasBlankChar) {
                lastWasBlankChar = false;
                sb.append("&nbsp;");
                }
            else {
                lastWasBlankChar = true;
                sb.append(' ');
                }
            }
        else {
            lastWasBlankChar = false;
            //
            // HTML Special Chars
            if (c == '"')
                sb.append("&quot;");
            else if (c == '&')
                sb.append("&amp;");
            else if (c == '<')
                sb.append("&lt;");
            else if (c == '>')
                sb.append("&gt;");
            else if (c == '\n')
                // Handle Newline
                sb.append("&lt;br/&gt;");
            else {
                int ci = 0xffff & c;
                if (ci < 160 )
                    // nothing special only 7 Bit
                    sb.append(c);
                else {
                    // Not 7 Bit use the unicode system
                    sb.append("&#");
                    sb.append(new Integer(ci).toString());
                    sb.append(';');
                    }
                }
            }
        }
    return sb.toString();
}
*/

}
