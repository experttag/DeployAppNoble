
package com.noble.communication.mail;


import com.noble.action.CheckOutActionForm;
import com.noble.admin.utility.StringHelper;
import java.util.ArrayList;
import org.apache.log4j.Logger;


/**
 *This class contain helper classes for mail functionality
 * @author NANDUS
 */
public class MailHelper {
  
 
private static Logger log = Logger.getLogger(MailHelper.class);

   /**
    * The method will send email to the mailid provided
    * @param emailList
    * @param emailSubjectTxt
    * @param emailMsgTxt
    * @return true for success and false for failure
    */
   public static boolean sendMail(CheckOutActionForm order) {

    boolean status=false;

    try{
        DirectMail mailer = new DirectMail();
        mailer.postMail( order.getImUserMail(),"your order has been recieved", createOrderBody(order) );
        log.info("Mail sending successfull");
        status=true;
    }
    catch(Exception e){
        log.error("Mail sending failed : " +e.getMessage());
    }

    return status;
  }


   /**
    * This method created mail body for mail to be sent for PNR status
    * @param name
    * @param login
    * @param password
    * @return
    */
   public static String createOrderBody(CheckOutActionForm order){
       StringBuffer body = new StringBuffer();

        body.append("Dear Sir,")
               //.append("\n\nNamaskar")
               .append("\n\nHope this mail would find you in best of your health and work spirit.")
               .append("\n\nYour order have been recieved successfully by Noble furnitures")
               .append("\nYour order details :")
               .append("\n\t\t\tOrder No: ").append(order.getImOrderNo())
               .append("\n\t\t\tOrder Details:\n\t\t\t ").append(StringHelper.parseOrder(order.getImOrderData()))
               .append("\n\t\t\tAddress Details:\n\t\t\t ").append(StringHelper.parseAddress(order.getImUserData()))
                .append("\n\nRegards,")
                .append("\nCustomer care Team")
                .append("\nNoble furnitures ")
                .append("\n\n\nHave a nice day.");

       return body.toString();
   }

}
