package org.mariapresso.impd.util;

import lombok.extern.slf4j.Slf4j;
import org.apache.commons.beanutils.BeanUtilsBean;
import org.mariapresso.impd.bean.communicate.ValidationSupporter;
import org.mariapresso.impd.constant.DateFormat;
import org.mariapresso.impd.constant.ResultType;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.validation.ObjectError;

/**
 * Created by ez2sarang on 15. 6. 7..
 */
@Slf4j
public class BindingHelper {
    public static boolean hasErrors(ValidationSupporter navi, BindingResult result, ResultType...defaultResultType) {
        try {
            if(null != defaultResultType && defaultResultType.length>0 && null != defaultResultType[0]) {
                navi.setResultCode(defaultResultType[0]);
            }
            if (result.hasErrors())
            {
                for(ObjectError error : result.getAllErrors())
                {
                    /*if(error instanceof FieldError) {
                        FieldError fieldError = (FieldError) error;
                        System.out.println(fieldError.getCode());
                    }
                    if(error instanceof ObjectError) {
                        ObjectError objectError = (ObjectError) error;
                        System.out.println(objectError.getCode());
                    }*/
                    log.info("{} : [{}] {} - {}", ResultType.INVALID_PARAMETER, ((FieldError) error).getField(), error.getDefaultMessage(), error.getCode());
                    navi.setResultCode(ResultType.INVALID_PARAMETER, String.format("%s : [%s] %s - %s", ResultType.INVALID_PARAMETER, ((FieldError) error).getField(), error.getDefaultMessage(), error.getCode()));
                }
                return true;
            }
            return false;
        } catch (Exception e) {
            log.error("Exeption[{}]", e.getMessage(), e);
            return true;
        }
    }

    public static BeanUtilsBean getBeanUtils(DateFormat...format) {
        boolean existFormat = false;
        if(null != format && format.length>0 && null != format[0]) {
            existFormat = true;
        }
        BeanUtilsBean beanUtilsBean = BeanUtilsBean.getInstance();
        beanUtilsBean.getConvertUtils().register(existFormat?format[0].getDateTimeConverter():DateFormat.defualt.getDateTimeConverter(), java.util.Date.class);
        return beanUtilsBean;
    }

    /*public static void main(String[] args) {
//        String dataDir = "/Users/ez2sarang/Documents/sync/Share/";
//        com.aspose.imaging.Image image = com.aspose.imaging.Image.load(dataDir + "IMG_0011.jpg");

        try {
            DebugFrame debugFrame = new DebugFrame();
            File f = new File("/Users/ez2sarang/Documents/sync/Share/IMG_0011.jpg");
            BufferedImage image = ImageIO.read(f);
            debugFrame.setImage(image);
            ImageClusterer clusterer = new ImageClusterer(image);

            while(clusterer.hasMoreClusters()) {
                Cluster cluster = clusterer.nextCluster();
                debugFrame.repaint();
            }
        } catch (IOException e) {
            e.printStackTrace();
        }

        if (false) {
            // The path to the documents directory.
            String dataDir = "/Users/ez2sarang/Downloads/Aspose_Imaging_Java-master/Examples/src/programmerguide/exportingimages/exportimagetodifferentformats/data/";

            //Load an existing image (of type Gif) in an instance of Image class
            com.aspose.imaging.Image image = com.aspose.imaging.Image.load(dataDir + "sample.gif");

            //Export to BMP file format using the default options
            image.save(dataDir + "output.bmp" , new com.aspose.imaging.imageoptions.BmpOptions());

            //Export to JPEG file format using the default options
            image.save(dataDir + "output.jpeg", new com.aspose.imaging.imageoptions.JpegOptions());

            //Export to PNG file format using the default options
            image.save(dataDir + "output.png", new com.aspose.imaging.imageoptions.PngOptions());

            //Export to TIFF file format using the default options
            image.save(dataDir + "output.tiff", new com.aspose.imaging.imageoptions.TiffOptions());
        }

        // Display Status.
        System.out.println("Image exported to BMP, JPG, PNG and TIFF formats successfully!");

    }*/
}
