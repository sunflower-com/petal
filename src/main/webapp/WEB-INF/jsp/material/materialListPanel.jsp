<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"  %>
<%@ page isELIgnored="false" %>
<jsp:include page="WEB-INF/jsp/meta.jsp"/>
<script type="text/javascript">
        function selectAll1(){
            var checked=$("#checkAll1").prop("checked");
            if(checked){
                $("input[type='checkbox'].checkbox-contorl").prop("checked",true);
            }else{
                $("input[type='checkbox'].checkbox-contorl").prop("checked",false);
            }
        }
        function selectAll2(){
            var checked=$("#checkAll2").prop("checked");
            if(checked){
                $("input[type='checkbox'].checkbox-contorl").prop("checked",true);
            }else{
                $("input[type='checkbox'].checkbox-contorl").prop("checked",false);
            }
        }
    </script>

<div class="panel panel-success">
    <div class="panel-heading panel-info">
        <h3 class="panel-title">材料列表</h3>
    </div>
    <div class="panel-body">
        <div class="table-responsive">
            <table id="materialList_tb" class="table-bordered table-hover table-condensed">
                <thead>
                <tr>
                    <th><input id="checkAll1" class="checkbox-contorl" type="checkbox" onclick=selectAll1()></th>
                    <th>序号</th>
                    <%--<th>材料编号</th>--%>
                    <th>材料名称</th>
                    <th>规格</th>
                    <th>颜色</th>
                    <th>单位</th>
                    <th>分类</th>
                    <th>进价</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="material" items="${materials}" varStatus="status">
                    <tr>
                        <td><input class="checkbox-contorl" type="checkbox"></td>
                        <td><c:out value="${status.index}" /></td>
                        <%--<td><c:out value="${material.identifier}" /></td>--%>
                        <td><c:out value="${material.name}" /></td>
                        <td><c:out value="${material.guige}" /></td>
                        <td><c:out value="${material.yanse}" /></td>
                        <td><c:out value="${material.danwei}" /></td>
                        <td><c:out value="${material.materialCategory.name}" /></td>
                        <td><c:out value="${material.jinjia}" /></td>
                        <td>
                            <button type="button" class="btn btn-xs btn-info" onclick="location.href='/material?method=getMaterial&id='+${material.id}">
                                <spam class="glyphicon glyphicon glyphicon-pencil"></spam>
                            </button>
                            <button type="button" class="btn btn-xs btn-danger" onclick="location.href='/material?method=deleteMaterial&id='+${material.id}">
                                <span class="glyphicon glyphicon-remove"></span>
                            </button>
                        </td>

                    </tr>
                </c:forEach>

                </tbody>
                <tfoot>
                <tr>
                    <th><input id="checkAll2" class="checkbox-contorl" type="checkbox" onclick="selectAll2()"></th>
                    <th colspan=9>
                        <div class="row" >
                            <div class="col-sm-2">
                                <button class="btn btn-xs btn-warning" >批量删除</button>
                            </div>
                            <div class="col-sm-5 col-sm-offset-1">
                                <ul class="pagination pagination-sm">
                                    <li><a href="#">&laquo;</a></li>
                                    <li><a href="#">1</a></li>
                                    <li><a href="#">2</a></li>
                                    <li><a href="#">3</a></li>
                                    <li><a href="#">&laquo;</a></li>
                                </ul>
                            </div>
                        </div>

                    </th>
                </tr>
                </tfoot>
            </table>
        </div>

    </div>
    <div class="panel-footer">

    </div>
</div>
