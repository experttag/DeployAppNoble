
package com.noble.utility;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import org.apache.struts.upload.FormFile;

/**
 *
 * @author NANDUS
 */
public class FileUpload {


    /**
     * Saves a file and returns its name
     * @param fileBean
     * @param dir where file should be stored
     * @param buf
     * @return filename
     * @throws java.io.IOException
     */
    public static String saveFile(FormFile fileBean, String dir) throws IOException {

        if (fileBean == null)
            return "";

        System.out.println("path---->" + dir);

        byte[] buf    = fileBean.getFileData();
        //new File(dir).mkdirs();
        File file = new File(dir, fileBean.getFileName());
        FileOutputStream output = new FileOutputStream(file);
        try {
            InputStream input = fileBean.getInputStream();
            try {
                while (true) {
                    int count = input.read(buf);
                    if (count == -1)
                        break;
                    output.write(buf, 0, count);
                }
            } finally {
                input.close();
            }
        } finally {
            output.close();
        }
        return fileBean.getFileName();
    }

    /**
     * This method checks if valid file is uploaded
     * @param fileBean
     * @return true if file is valid and false if invalid
     */
    public static boolean isValidFile(FormFile fileBean){

        if(fileBean!=null&&fileBean.getFileName()!=null&&!fileBean.getFileName().equalsIgnoreCase(""))
            return true;

        return false;
    }

}
