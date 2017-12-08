<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE HTML>
<html>
<head>
    <title>上传图片</title>
    <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
    <meta charset="utf-8">
</head>
<body>
<div>
    <a id="hengping">请横屏使用！</a>
</div>
<form name="formHead" method="post" action="photo_hecheng.action" id="formHead" enctype="multipart/form-data" >

    <div>
        <div>
            <input type="file" name="file" id="file_head" onchange="javascript:setImagePreview();"/>
        </div>
        <div>
            <div id="DivUp" style="display: none">
                <input type="submit" data-inline="true" id="BtnUp" value="确认上传" data-mini="true"/>
            </div>
        </div>
    </div>
</form>
<div data-role="fieldcontain">
    <div id="localImag">
        <img id="preview" width="-1" height="-1" style="display: none"/>
    </div>
</div>


<script type="text/javascript">
    //判断手机横竖屏状态：
    window.addEventListener("onorientationchange" in window ? "orientationchange" : "resize", function() {
        if (window.orientation === 180 || window.orientation === 0) {
            $("#hengping").removeAttr("style");
            alert('请横屏使用此功能');
        }
        if (window.orientation === 90 || window.orientation === -90 ){
            $("#hengping").attr("style","display:none")
            //alert('横屏状态！');
        }
    }, false);
    //移动端的浏览器一般都支持window.orientation这个参数，通过这个参数可以判断出手机是处在横屏还是竖屏状态。
    function setImagePreview() {
        var preview, img_txt, localImag, file_head = document.getElementById("file_head"),
            picture = file_head.value;
        if (!picture.match(/.jpg|.gif|.png|.bmp/i)) return alert("您上传的图片格式不正确，请重新选择！"),
            !1;
        if (preview = document.getElementById("preview"), file_head.files && file_head.files[0]) preview.style.display = "block",
            preview.style.width = "63px",
            preview.style.height = "63px",
            preview.src = window.navigator.userAgent.indexOf("Chrome") >= 1 || window.navigator.userAgent.indexOf("Safari") >= 1
                ? window.webkitURL.createObjectURL(file_head.files[0]) : window.URL.createObjectURL(file_head.files[0]);
        else {
            file_head.select(),
                file_head.blur(),
                img_txt = document.selection.createRange().text,
                localImag = document.getElementById("localImag"),
                localImag.style.width = "63px",
                localImag.style.height = "63px";
            try {
                localImag.style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale)",
                    localImag.filters.item("DXImageTransform.Microsoft.AlphaImageLoader").src = img_txt
            } catch (f) {
                return alert("您上传的图片格式不正确，请重新选择！"),
                    !1
            }
            preview.style.display = "none",
                document.selection.empty()
        }
        return document.getElementById("DivUp").style.display = "block",
            !0
    }
</script>
</body>
</html>