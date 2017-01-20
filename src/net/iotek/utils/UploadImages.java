package net.iotek.utils;

import org.apache.commons.lang.StringUtils;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 *
 * 图片上传工具类
 */
public class UploadImages {

    public String upLoadImage(HttpServletRequest request, MultipartFile image, String path){
        List<String> fileTypes = new ArrayList<String>();
        String path3 = new SimpleDateFormat("yyyyMMdd").format(new Date());//创建文件夹路径
        fileTypes.add("jpg");  
        fileTypes.add("jpeg");  
        fileTypes.add("bmp");  
        fileTypes.add("gif");  
        fileTypes.add("png");  
        fileTypes.add("tiff");  
        fileTypes.add("psd");  
        fileTypes.add("swf");  
        fileTypes.add("svg");
        String savePath="";
        if (StringUtils.isNotBlank(image.getOriginalFilename())) {
            File file = this.getFile(image, path, path3, fileTypes);
            savePath=file.getName();
        }
        return "/pictures/"+path3+"/"+savePath;
    }  
  
    private File getFile(MultipartFile imgFile,String typeName,String brandName,List fileTypes) {
        String fileName = imgFile.getOriginalFilename();
         String ext = fileName.substring(fileName.lastIndexOf(".")+1,fileName.length());
         ext = ext.toLowerCase();    
             
         File file = null;    
         if(fileTypes.contains(ext)) {                      //如果扩展名属于允许上传的类型，则创建文件    
             fileName = UUID.randomUUID().toString()+'.'+ext;
             file = this.creatFolder(typeName, brandName, fileName);    
             try {    
                imgFile.transferTo(file);                   //保存上传的文件    
            } catch (IllegalStateException e) {    
                e.printStackTrace();    
            } catch (IOException e) {
                e.printStackTrace();    
            }    
         }    
         return file;    
    }    
     private File creatFolder(String typeName,String brandName,String fileName) {    
         File file = null;    
         typeName = typeName.replaceAll("/", "");               //去掉"/"    
         typeName = typeName.replaceAll(" ", "");               //替换半角空格    
         typeName = typeName.replaceAll(" ", "");               //替换全角空格
         brandName = brandName.replaceAll("/", "");             //去掉"/"    
         brandName = brandName.replaceAll(" ", "");             //替换半角空格    
         brandName = brandName.replaceAll(" ", "");             //替换全角空格    
            
         File firstFolder = new File(typeName);                 //一级文件夹
         if(firstFolder.exists()) {                             //如果一级文件夹存在，则检测二级文件夹    
             File secondFolder = new File(firstFolder,brandName);    
             if(secondFolder.exists()) {                        //如果二级文件夹也存在，则创建文件    
                 file = new File(secondFolder,fileName);    
             }else {                                            //如果二级文件夹不存在，则创建二级文件夹    
                 secondFolder.mkdir();    
                 file = new File(secondFolder,fileName);        //创建完二级文件夹后，再合建文件    
             }    
         }else {                                                //如果一级不存在，则创建一级文件夹    
             firstFolder.mkdir();    
             File secondFolder = new File(firstFolder,brandName);    
             if(secondFolder.exists()) {                        //如果二级文件夹也存在，则创建文件    
                 file = new File(secondFolder,fileName);    
             }else {                                            //如果二级文件夹不存在，则创建二级文件夹    
                 secondFolder.mkdir();    
                 file = new File(secondFolder,fileName);    
             }    
         }    
         return file;    
    }
}  