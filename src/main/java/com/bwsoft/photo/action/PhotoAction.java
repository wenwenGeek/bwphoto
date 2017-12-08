package com.bwsoft.photo.action;


import com.opensymphony.xwork2.ActionSupport;
import com.util.HebingPng;
import com.util.ImageEncoderService;
import org.apache.struts2.ServletActionContext;

import java.io.*;
import java.util.UUID;

/**
 * Created by 崔博文 on 2017/12/7.13:57
 */
public class PhotoAction extends ActionSupport {

    private File file;
    private String fileFileName;

    private String fileContentType;

    private String dataUrl;

    private String imgUrl;

    String imgpath = "upload/";

    public String hecheng () throws IOException {

        // �ļ����·��
        InputStream is = new FileInputStream(file);

        String path = ServletActionContext.getServletContext().getRealPath("/");
        System.out.println(path);
        //    String root = "D:\\";
        String uuid = UUID.randomUUID().toString();

        dataUrl = imgpath + uuid;

        File destFile = new File(path + imgpath, uuid+ fileFileName.substring(fileFileName.indexOf("."), fileFileName.length()));

        OutputStream os = new FileOutputStream(destFile);

        byte[] buffer = new byte[400];

        int length = 0;

        while((length = is.read(buffer)) > 0) {
            os.write(buffer, 0, length);
        }

        is.close();

        os.close();

        imgUrl = hecheng(path + imgpath + uuid + fileFileName.substring(fileFileName.indexOf("."), fileFileName.length()), path);
        return SUCCESS;
    }

    public String hecheng (String paizhaoPath, String path) {
        String newImgName = UUID.randomUUID().toString();
        String newPath = path + imgpath + newImgName + ".png";
        String outImgName = UUID.randomUUID().toString() + ".png";
        String outPath = path + imgpath + outImgName;
        ImageEncoderService.getInstance().narrowAndFormateTransfer(paizhaoPath, newPath, 1063, 1890, "png");
        HebingPng.changeSize(path + "image/FTWRES.png", path + imgpath + "f.png", 1890, 1063, false);
        HebingPng.mergeImage(newPath, path + imgpath + "f.png", outPath);
        return imgpath + outImgName;
    }

    public File getFile () {
        return file;
    }

    public void setFile (File file) {
        this.file = file;
    }

    public String getFileFileName () {
        return fileFileName;
    }

    public void setFileFileName (String fileFileName) {
        this.fileFileName = fileFileName;
    }

    public String getFileContentType () {
        return fileContentType;
    }

    public void setFileContentType (String fileContentType) {
        this.fileContentType = fileContentType;
    }

    public String getDataUrl () {
        return dataUrl;
    }

    public void setDataUrl (String dataUrl) {
        this.dataUrl = dataUrl;
    }

    public String getImgUrl () {
        return imgUrl;
    }

    public void setImgUrl (String imgUrl) {
        this.imgUrl = imgUrl;
    }
}
