<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../jstl.jsp"/>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="../meta.jsp"/>
    <div class="panel panel-success">
        <div class="panel-heading">
            <a href="materialListPanel.jsp"> list </a>
            <h3 class="panel-title">材料信息</h3>
        </div>
        <div class="panel-body">
            <form id="material_form" class="form-horizontal" role="form" modelAttribute="material" action="/material?method=saveMaterial" method="post">
                <div class="form-group">
                    <label class="col-sm-2 control-label" for="identifier">编号</label>
                    <div class="col-sm-10">
                        <input class="form-control input-sm" id="identifier" name="identifier" value="${material.identifier}"/>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label" for="name">名称</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control input-sm" id="name" name="name" value="${material.name}"/>
                    </div>
                </div>
                <div class="form-group">
                        <label class="col-sm-2 control-label" for="guige">规格</label>
                    <div class="col-sm-10">
                        <input type="text"  class="input-group-sm" id="guige" name="guige" value="${material.guige}"/>
                        <label for="yanse">颜色</label>
                        <input type="text"  class="input-group-sm" id="yanse" name="yanse" value="${material.yanse}"/>
                        <label  for="danwei">单位</label>
                        <select id="danwei" size="1" name="${material.danwei}">
                            <option value ="volvo">个</option>
                            <option value ="volvo">件</option>
                            <option value ="volvo">套</option>
                            <option value ="volvo">组</option>
                        </select>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label" for="jinjia">进货价</label>
                    <div class="col-sm-10">
                        <input class="form-control input-sm" id="jinjia" name="jinjia" value="${material.jinjia}"/>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label" for="category">分类</label>
                    <div class="col-sm-10">
                        <input class="form-control input-sm" id="category" value="${material.materialCategory.name}"/>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label" for="beizhu">备注</label>
                    <div class="col-sm-10">
                        <textarea class="form-control" rows="3" id="beizhu" name="beizhu"></textarea>
                    </div>
                </div>
                <button class="btn btn-sm btn-success" type="submit" form="material_form">保存</button>
            </form>
        </div>
    </div>
