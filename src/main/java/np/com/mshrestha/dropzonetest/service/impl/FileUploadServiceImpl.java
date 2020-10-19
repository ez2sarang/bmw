package np.com.mshrestha.dropzonetest.service.impl;

import java.util.List;

import np.com.mshrestha.dropzonetest.dao.FileUploadDao;
import np.com.mshrestha.dropzonetest.model.UploadedFile;
import np.com.mshrestha.dropzonetest.service.FileUploadService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class FileUploadServiceImpl implements FileUploadService {

  @Autowired
  private FileUploadDao fileUploadDao;

  @Transactional(readOnly = true)
  public List<UploadedFile> listFiles() {

    return fileUploadDao.listFiles();
  }

  @Transactional(readOnly = true)
  public UploadedFile getFile(Long id) {
    return fileUploadDao.getFile(id);
  }

  @Transactional
  public UploadedFile saveFile(UploadedFile uploadedFile) {
    return fileUploadDao.saveFile(uploadedFile);

  }

}
