/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.noble.admin.utility;


import java.text.DateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.StringTokenizer;

/**
 *
 * @author nandus
 */
public class DateHelper {


     /**
     * THis method calculates week end dates depending on day of week provided
     * @param date
     * @param position , 0 for start date of week and 1 for end day of week
     * @return return start date of week or end date of week
     */
    public static Date getWeekDate(Date date,int position) {

    int dayofweek;

    Calendar cal = Calendar.getInstance();
    cal.setTime(date); // #1

     dayofweek = cal.get(Calendar.DAY_OF_WEEK);

     if(position==0)
        cal.add(Calendar.DAY_OF_WEEK, -dayofweek+1);
     else
        cal.add(Calendar.DAY_OF_WEEK, -dayofweek+7);

     return cal.getTime();
    }


    /**
     * This method will return start or end date based on offeset provided
     * @param date : current
     * @param position : 0 for returning start of week and 1 for returning end of week
     * @param offset : -7 for last week  and +7 for next week
     * @return
     */
    public static Date getWeekDate(Date date,int position,int offset) {

    int dayofweek;

    Calendar cal = Calendar.getInstance();
    cal.setTime(date); // #1

     dayofweek = cal.get(Calendar.DAY_OF_WEEK);

     if(position==0)
        cal.add(Calendar.DAY_OF_WEEK, -dayofweek+1 + offset);
     else
        cal.add(Calendar.DAY_OF_WEEK, -dayofweek+7  + offset);

     return cal.getTime();
    }



    /**
     * This method return date in mm/dd/yyyy format
     * @param date
     * @return
     */
    public static String getStringDate(Date date){

        if(date==null)
             return "";
        else{
            DateFormat df = DateFormat.getDateInstance(DateFormat.SHORT);
            return df.format(date);
        }
    }

    /**
     * This method return date in #date# format
     * @param date
     * @return
     */
    public static String appendHash(String date){

        StringBuffer stringDate = new StringBuffer("#");          
                     stringDate.append(date)
                             .append("#");
        return stringDate.toString();
    }

   

    /**
     * This method add or subtract from the given date, the number of days specified as offset
     * @param date
     * @param offset
     * @return
     */
    public static Date getDate(Date date,int offset) {

    Calendar cal = Calendar.getInstance();
     cal.setTime(date);

     cal.add(Calendar.DAY_OF_MONTH, offset);

     return cal.getTime();
    }



    /**
     * This method convert string date format from ddmmyy to mmddyy
     * @param date
     * @return
     */
    public static String ddmmyyyyTommddyy(String date){

        StringTokenizer st = new StringTokenizer(date, "/");
        StringBuffer stringDate = new StringBuffer("");
        String day= st.nextToken();

        stringDate.append(st.nextToken())
                    .append("/")
                    .append(day)
                    .append("/")
                    .append(st.nextToken());
        
        return stringDate.toString();
    }

}
