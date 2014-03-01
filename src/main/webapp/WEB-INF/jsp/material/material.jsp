<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<head>
    <title>petal</title>
    <jsp:include page="../meta.jsp"/>
</head>
<body>
<jsp:include page="../navbar.jsp"/>
<div id='content' class=row'>
    <div class="col-md-3">
        <jsp:include page="/materialCategory/list"/>
    </div>
    <div class="col-md-8">
        <jsp:include page="/material/list"/>
    </div>
</div>
<jsp:include page="../bottom.jsp"/>
</body>
</html>
