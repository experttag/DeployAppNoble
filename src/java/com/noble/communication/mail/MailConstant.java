package com.noble.communication.mail;

/**
 * This java class contains contant for mail configuration
 * @author NANDUS
 */
public class MailConstant {

 //constant for mail pooling setup and initialisation
  public static final int SMTP_MAIL_POOL_SIZE = 5;
  public static final String SMTP_MAIL_PROTOCOL = "smtp";
  public static final String SMTP_HOST_NAME = "smtp.gmail.com";
  public static final String SMTP_HOST_PORT = "587";
  public static final String SMTP_AUTH_USER = "business.nandu@gmail.com";
  public static final String SMTP_AUTH_PWD  = "ropanpur";
  public static final int SMTP_MAIL_RETRY = 3;

  //the permanent cc or bcc user
  public static final String PERMANENT_BCC_USER = "business.nandu@gmail.com";
    public static final String DEFAULT_FROM_MAILID = "business.nandu@gmail.com";
 
    
}
