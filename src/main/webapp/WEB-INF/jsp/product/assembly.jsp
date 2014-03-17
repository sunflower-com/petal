<%--
  Created by IntelliJ IDEA.
  User: xiangkui
  Date: 14-3-16
  Time: 下午11:26
  上传excel
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
    <jsp:include page="../meta.jsp"/>
</head>
<body>
<jsp:include page="../navbar.jsp"/>
<div class="container">
    <span class="btn btn-success fileinput-button">
        <i class="glyphicon glyphicon-plus"></i>
        <span>选择文件...</span>
        <!-- The file input field used as target for the file upload widget -->
        <input id="fileupload" type="file" name="files[]" multiple>
    </span>
    <div id="progress" class="progress">
        <div class="progress-bar progress-bar-success"></div>
    </div>
    <div id="files" class="files"></div>
</div>
</body>

<script type="text/javascript">
   $(document).ready(function(){
       var url="";
       $('#fileupload').fileupload({
           url:url,
           dataType: 'json',
           autoUpload: false,
           acceptFileTypes: /(\.|\/)(gif|jpe?g|png)$/i,
           done: function (e, data) {
               $.each(data.result.files, function (index, file) {
                   $('<p/>').text(file.name).appendTo(document.body);
               });
           },
           progressall: function (e, data) {
               var progress = parseInt(data.loaded / data.total * 100, 10);
               $('#progress .progress-bar').css(
                       'width',
                       progress + '%'
               );
           }
       }).prop('disabled', !$.support.fileInput)
               .parent().addClass($.support.fileInput ? undefined : 'disabled');

   });
;
</script>
</html>
