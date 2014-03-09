<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<%
    String appContext = request.getContextPath();
    String basePath =  request.getScheme()+"://"+request.getServerName()+":"+ request.getServerPort() + appContext;
%>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="<%=basePath%>/css/petal.css">
<link rel="stylesheet" href="<%=basePath%>/lib/bootstrap/3.1.0/css/bootstrap.css">
<link rel="stylesheet" href="<%=basePath%>/lib/bootstrap/3.1.0/css/bootstrap-theme.css">

<script src="<%=basePath%>/lib/jquery-1.9.1.min.js"></script>
<script src="<%=basePath%>/lib/bootstrap/3.1.0/js/bootstrap.js"></script>
<%--<script src="<%=basePath%>/lib/tablePagination.js"></script>--%>
<script src="<%=basePath%>/lib/bootstrap/ext/bootstrap-paginator.js"></script>



