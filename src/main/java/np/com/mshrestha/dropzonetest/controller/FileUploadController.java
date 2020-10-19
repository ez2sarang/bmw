package np.com.mshrestha.dropzonetest.controller;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import np.com.mshrestha.dropzonetest.model.UploadedFile;
import np.com.mshrestha.dropzonetest.service.FileUploadService;

import org.apache.commons.fileupload.disk.DiskFileItem;
import org.apache.commons.io.FileUtils;
import org.mariapresso.impd.constant.Pages;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

@Controller
public class FileUploadController {

    @Autowired
    private FileUploadService fileUploadService;

    @RequestMapping(value = "/up")
    public String home(Map<String, Object> map) {
        map.put("fileList", fileUploadService.listFiles());
        return Pages.main.viewPage("fileUploader");
    }


    @RequestMapping(value = "/testUpload", method = RequestMethod.POST)
    public
    @ResponseBody
    List<UploadedFile> upload(MultipartHttpServletRequest request,
                              HttpServletResponse response) throws IOException {

        // Getting uploaded files from the request object
        Map<String, MultipartFile> fileMap = request.getFileMap();

        // Maintain a list to send back the files info. to the client side
        List<UploadedFile> uploadedFiles = new ArrayList<UploadedFile>();

        // Iterate through the map
        for (MultipartFile multipartFile : fileMap.values()) {

            // Save the file to local disk
            saveFileToLocalDisk(multipartFile);

            UploadedFile fileInfo = getUploadedFileInfo(multipartFile);

            // Save the file info to database
            fileInfo = saveFileToDatabase(fileInfo);

            // adding the file info to the list
            uploadedFiles.add(fileInfo);
        }

        return uploadedFiles;
    }


    @RequestMapping(value = {"/list"})
    public String listBooks(Map<String, Object> map) {

        map.put("fileList", fileUploadService.listFiles());

        return "/listFiles";
    }


    @RequestMapping(value = "/get/{fileId}")
    public void getFile(HttpServletResponse response, @PathVariable Long fileId) {

        UploadedFile dataFile = fileUploadService.getFile(fileId);

        File file = new File(dataFile.getLocation(), dataFile.getName());

        try {
            response.setContentType(dataFile.getType());
            response.setHeader("Content-disposition", "attachment; filename=\"" + dataFile.getName()
                    + "\"");

            FileCopyUtils.copy(FileUtils.readFileToByteArray(file), response.getOutputStream());

        } catch (IOException e) {
            e.printStackTrace();
        }
    }


    private void saveFileToLocalDisk(MultipartFile multipartFile) throws IOException,
            FileNotFoundException {

        String outputFileName = getOutputFilename(multipartFile);

//        FileCopyUtils.copy(multipartFile.getBytes(), new FileOutputStream(outputFileName));
        boolean move = false;
        try {
            FileUtils.moveFile(((DiskFileItem) ((CommonsMultipartFile) multipartFile).getFileItem()).getStoreLocation(), new File(outputFileName));
            move = true;
        } catch (IOException e) {
            e.printStackTrace();
        }
        if (!move) {//imgExt.equalsIgnoreCase("JPG") || imgExt.equalsIgnoreCase("JPEG") || imgExt.equalsIgnoreCase("GIF")){
            byte[] bytes = multipartFile.getBytes();
            try {
                FileOutputStream lFileOutputStream = new FileOutputStream(new File(outputFileName));
                lFileOutputStream.write(bytes);
                lFileOutputStream.close();
            } catch (IOException ie) {
                //Exception 처리
                System.err.println("File writing error! ");
            }
            System.err.println("File upload success! ");
        } else {
            System.err.println("File type error! ");
        }
    }

    private UploadedFile saveFileToDatabase(UploadedFile uploadedFile) {

        return fileUploadService.saveFile(uploadedFile);

    }

    private String getOutputFilename(MultipartFile multipartFile) {

        return getDestinationLocation() + multipartFile.getOriginalFilename();
    }

    private UploadedFile getUploadedFileInfo(MultipartFile multipartFile) throws IOException {

        UploadedFile fileInfo = new UploadedFile();
        fileInfo.setName(multipartFile.getOriginalFilename());
        fileInfo.setSize(multipartFile.getSize());
        fileInfo.setType(multipartFile.getContentType());
        fileInfo.setLocation(getDestinationLocation());

        return fileInfo;
    }

    private String getDestinationLocation() {
        return "/Users/ez2sarang/Documents/dev/service/";
    }
}
