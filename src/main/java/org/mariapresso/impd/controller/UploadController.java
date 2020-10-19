package org.mariapresso.impd.controller;

import org.apache.commons.fileupload.disk.DiskFileItem;
import org.apache.commons.io.FileUtils;
import org.mariapresso.config.RootConfig;
import org.mariapresso.impd.bean.communicate.UploadItem;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by ez2sarang on 15. 6. 23..
 */
@Controller
@RequestMapping(value = "/x/upload")
public class UploadController {

    /*@Autowired
    private MessageSourceAccessor messageSourceAccessor;*/



    @RequestMapping(method = RequestMethod.GET)
    public String getUploadForm(Model model)
    {
        model.addAttribute(new UploadItem());
        return "upload/uploadForm";
    }

    @RequestMapping(method = RequestMethod.POST)
    public @ResponseBody List<File>
    create(HttpServletRequest request, UploadItem uploadItem, BindingResult result) throws Exception
    {
        List<File> uploadedFile = new ArrayList<>();
        if (result.hasErrors())
        {
            for(ObjectError error : result.getAllErrors())
            {
                System.err.println("Error: " + error.getCode() +  " - " + error.getDefaultMessage());
            }
            return uploadedFile;
        }
        if(null != uploadItem) {
            for(CommonsMultipartFile item: uploadItem.getFileData()) {
                if(!item.isEmpty()){
                    String filename = item.getOriginalFilename();
                    String imgExt = filename.substring(filename.lastIndexOf(".")+1, filename.length());

                    //upload 가능한 파일 타입 지정
                    File lOutFile = new File(RootConfig.REPOSITORY_TEMP_PATH+"/"+uploadItem.getTxToken()+"/"+((DiskFileItem) item.getFileItem()).getStoreLocation().getName().replaceAll("(^upload_|[.]tmp$)",""),filename);
                    boolean makesDir = lOutFile.getParentFile().mkdirs();
                    boolean move = false;
                    try {
                        FileUtils.moveFile(((DiskFileItem) item.getFileItem()).getStoreLocation(), lOutFile);
                        System.out.println(String.format("[%b]realFilePath=<%s>, %s ----jsessionId:%s", makesDir, lOutFile.getParentFile().getName(), filename, request.getSession().getId()));
                        move = true;
                    } catch (IOException e) {
                        e.printStackTrace();
                    }
                    if(!move){//imgExt.equalsIgnoreCase("JPG") || imgExt.equalsIgnoreCase("JPEG") || imgExt.equalsIgnoreCase("GIF")){
                        byte[] bytes = item.getBytes();
                        try{
                            FileOutputStream lFileOutputStream = new FileOutputStream(lOutFile);
                            lFileOutputStream.write(bytes);
                            lFileOutputStream.close();
                        }catch(IOException ie){
                            //Exception 처리
                            System.err.println("File writing error! ");
                        }
                        System.err.println("File upload success! ");
                    }else{
                        System.err.println("File type error! ");
                    }
                    uploadedFile.add(lOutFile);
                    if (false) {
                        long start = System.currentTimeMillis();
                        try {
                            File a = new File("/Volumes/Share/ziminrepository/ftpHome/fast2","국제시장.mp4");
                            File b = new File("/Volumes/Share/ziminrepository/asset/201506/302", "bunker1.mp4");
                            boolean go = b.getParentFile().mkdirs();
//                            @Log ("[%b]renameTo[%b]", go, a.renameTo(b));
                            FileUtils.moveFile(a, b);
                        } catch (Exception e) {
                            e.printStackTrace();
                        }
                        System.out.println(System.currentTimeMillis() - start);
                    }
                }
                if(false) {
                    throw new Exception("XXX");
                }
                // Some type of file processing...
                System.err.println("-------------------------------------------");
                System.err.println("Test upload: " + uploadItem.getSessionToken());
                System.err.println("Test upload: " + uploadItem.getTxToken());
                System.err.println("Test upload: " + item.getOriginalFilename());
                System.err.println("-------------------------------------------");
            }

            /*if(!uploadItem.getFileData().isEmpty()){
                String filename = uploadItem.getFileData().getOriginalFilename();
                String imgExt = filename.substring(filename.lastIndexOf(".")+1, filename.length());

                //upload 가능한 파일 타입 지정
                if(imgExt.equalsIgnoreCase("JPG") || imgExt.equalsIgnoreCase("JPEG") || imgExt.equalsIgnoreCase("GIF")){
                    byte[] bytes = uploadItem.getFileData().getBytes();
                    try{
                        File lOutFile = new File("/Users/ez2sarang/upload"+"_"+filename);
                        FileOutputStream lFileOutputStream = new FileOutputStream(lOutFile);
                        lFileOutputStream.write(bytes);
                        lFileOutputStream.close();
                    }catch(IOException ie){
                        //Exception 처리
                        System.err.println("File writing error! ");
                    }
                    System.err.println("File upload success! ");
                }else{
                    System.err.println("File type error! ");
                }
            }

            // Some type of file processing...
            System.err.println("-------------------------------------------");
            System.err.println("Test upload: " + uploadItem.getName());
            System.err.println("Test upload: " + uploadItem.getFileData().getOriginalFilename());
            System.err.println("-------------------------------------------");*/

        }
        return uploadedFile;
    }
}
