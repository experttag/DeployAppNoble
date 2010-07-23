
package com.noble.utility;

/**
 *
 * @author NANDUS
 */
public class ParseData {

    /**
     * This method will take a string as parametr and return integer if string
     * conatain valid number else return 0
     */

    public static int parseInt(String string){

        int num=0;

        if(string!=null){
            string.trim();
            try{
            if(string.length()>0)
                num = Integer.parseInt(string);
            }
            catch(Exception e){

            }
        }
        return num;
    }


    /**
     * This method will take a string as parametr and return float if string
     * contain valid float else return 0
     */

    public static float parseFloat(String string){

        float num =0;

        if(string!=null){
            string.trim();
            try{
            if(string.length()>0)
                num = Float.parseFloat(string);
            }
            catch(Exception e){

            }
        }
        return num;
    }

    /**
     * This method will take a string as parametr and return valid string
     */

    public static String parseString(String string){

        if(string!=null){
            string.trim();
        }
        else
            string ="";
        return string;
    }

    /**
     * This method checks a string and returns true if its valide , if it is null or blank it returns false
     * @param string
     * @return
     */
    public static boolean isValidString(String string){

        if(string==null)
        return false;
        else
            if((string.trim()).equalsIgnoreCase(""))
                return false;
            else
                return true;
        
    }
}
