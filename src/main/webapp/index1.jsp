<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
    <title>上传图片</title>
    <script type="text/javascript" src="jquery-1.7.2.min.js"></script>
</head>
<body>
<input id="upload" type="file" accept="image/*;" capture="camera" >
<img class="img_wrap" style="" src="">
<script type="text/javascript">
    ;
    var demo_h5_upload_ops = {
        init:function(){
            this.eventBind();
        },
        eventBind:function(){
            var that = this;
            $("#upload").change(function(){
                var reader = new FileReader();
                reader.onload = function (e) {
                    that.compress(this.result);
                };
                reader.readAsDataURL(this.files[0]);
            });
        },
        compress : function (res) {
            var that = this;
            var img = new Image(),
                maxH = 300;

            img.onload = function () {
                var cvs = document.createElement('canvas'),
                    ctx = cvs.getContext('2d');

                if(img.height > maxH) {
                    img.width *= maxH / img.height;
                    img.height = maxH;
                }
                cvs.width = img.width;
                cvs.height = img.height;

                ctx.clearRect(0, 0, cvs.width, cvs.height);
                ctx.drawImage(img, 0, 0, img.width, img.height);
                var dataUrl = cvs.toDataURL('image/jpeg', 1);
                $(".img_wrap").attr("src",dataUrl);
                $(".img_wrap").show();
                // 上传略
                that.upload( dataUrl );
            };

            img.src = res;
        },
        upload:function( image_data ){
            /*这里写上次方法,图片流是base64_encode的*/
        }
    };


    $(document).ready( function(){
        demo_h5_upload_ops.init();
    } );
</script>
</body>
</html>
