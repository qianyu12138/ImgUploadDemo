<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/themes/default/default.css" />
    <script src="${pageContext.request.contextPath}/static/kindeditor-all-min.js"></script>
    <script src="${pageContext.request.contextPath}/static/lang/zh-CN.js"></script>
</head>
<script>
    KindEditor.ready(function(K) {
        var editor = K.editor({
            filePostName:"uploadFile",//上传组件名
            uploadJson: '${pageContext.request.contextPath}/upload',//上传地址
            allowFileManager : true
        });
        K('#J_selectMutiImage').click(function() {
            editor.loadPlugin('multiimage', function() {
                editor.plugin.multiImageDialog({
                    clickFn : function(urlList) {
                        var div = K('#J_imageView');
                        div.html('');
                        K.each(urlList, function(i, data) {
                            div.append('<img src="' + data.url + '">');
                            var imgs = K("#imgs");
                            imgs.val(imgs.val()+data.url+";");
                        });
                        editor.hideDialog();
                    }
                });
            });
        });
        K('#J_selectImage').click(function() {
            editor.loadPlugin('image', function() {
                editor.plugin.imageDialog({
                    showRemote : false,
                    clickFn : function(url) {
                        var div = K('#J_imageView2');
                        div.html('');
                        div.append('<img src="' + url + '">');
                        var imgs = K("#img");
                        imgs.val(url);
                        editor.hideDialog();
                    }
                });
            });
        });
    });
</script>
<body>
    <form action="sub" method="post">
        <input type="hidden" name="imgs" id="imgs"/>
        <input type="button" id="J_selectMutiImage" value="批量上传" />
        <div id="J_imageView"></div>
        <input type="submit" value="提交"/>
    </form>

    <form action="sub" method="post">
        <input type="hidden" name="img" id="img"/>
        <input type="button" id="J_selectImage" value="图片上传" />
        <div id="J_imageView2"></div>
        <input type="submit" value="提交"/>
    </form>
</body>
</html>