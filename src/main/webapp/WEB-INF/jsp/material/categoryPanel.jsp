<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="../meta.jsp"/>
<div class="panel panel-success">
    <div class="panel-heading panel-info">
        <div class="row">
            <div class="col-md-4 panel-title">材料分类</div>
            <div class="col-md-5 col-sm-offset-3">
                <button type="button" class="btn btn-xs btn-success" onclick="addCategory()"><span class="glyphicon glyphicon glyphicon-plus"></span></button>
                <button type="button" class="btn btn-xs btn-info" onclick="editCategory()"><spam class="glyphicon glyphicon glyphicon-pencil"></spam></button>
                <button type="button" class="btn btn-xs btn-danger" onclick="deleteCategory()"><span class="glyphicon glyphicon-remove"></span></button>
            </div>
        </div>
    </div>
    <div class="panel-body">
        <table id="category_tb" class="table table-condensed table-hover">
            <c:forEach var="category" items="${categorys}" varStatus="status">
                <tr>
                    <input type='hidden' id=${category.id}>
                    <td class="success"><c:out value="${category.name}" /></td>
                </tr>
            </c:forEach>
        </table>
    </div>
</div>
<script type="text/javascript">
    var numId=$("#category_tb tbody td");//td prototype
    var dblclickEvent;
    var clickEvent;
    $(function(){
        numId.bind("dblclick",dblclickEvent=function(){
            var tdIns=$(this);
            var tdpar=$(this).parent("tr");
            tdpar.css("background-color","yellow");
            if(tdIns.children("input").length>0){return false};
            var inputIns=$("<input type='text'/>");
            var text=$(this).html();
            inputIns.width(tdIns.width());
            inputIns.val(tdIns.html());
            tdIns.html("");
            inputIns.appendTo(tdIns).focus().select();
            inputIns.click(function(){
                return false;
            });
            inputIns.blur(function(){
                var inputText=$(this).val();
                tdIns.html(inputText);
                tdpar.css("background-color","white");
            });
        });
        numId.bind("click",clickEvent=function(){
            $("#category_tb tbody td").removeClass("choosed");
            $("#category_tb tbody td").removeClass("warning");
            $("#category_tb tbody td").addClass("success");
            var obj=$(this);
            obj.removeClass("success");
            obj.addClass("warning");
            obj.addClass("choosed");
        });

        $(numId).addClass("success");
    });


    function addCategory(){
        var tdInt=$("<td class='success'>***</td>");
        $(tdInt).on("dblclick",dblclickEvent);
        $(tdInt).on("click",clickEvent);
        var trInt=$("<tr></tr>");
        trInt.append(tdInt);
        $("#category_tb tbody").append(trInt);
        tdInt.click();
    }
    function deleteCategory(){
        var url="/materialCategory?method=deleteCategory";
        var tdInt=$("#category_tb td.choosed");
        var trInt=tdInt.parent();
        var inputInt=trInt.child("input");
        var id=inputInt.attr("id")
        alert(id)
        var data={
            id:id
        };
        console.log(data)
        $.get(url,data,function (data, textStatus){
            alert(data);
        });
    }
    function editCategory(){
        var tdInt=$("#category_tb tbody tr.choosed");
        tdInt.click();
    }
</script>

