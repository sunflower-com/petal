<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../jstl.jsp" %>
<jsp:include page="../meta.jsp"/>
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

    function loadOnePage(pageSize,pageIndex){
        $.ajax({
            url:"/pagination/material",
            type:"POST",
            data:{
                pageSize:pageSize,
                pageIndex:pageIndex
            },
            dataType:"json"
        }).done(function(msg){
            var materials=msg.list;
            var tbody=$("#material_tb tbody")
            tbody.children('tr').remove();
            for(var i in materials){
                var material=materials[i];
                var tr_template=$("<tr><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td></tr>");
                var check="<input class='checkbox-contorl' type='checkbox'>"
                $(tr_template).children("td:eq(0)").append(check);
                $(tr_template).children("td:eq(1)").html(i);
                $(tr_template).children("td:eq(2)").html(material.name);
                $(tr_template).children("td:eq(3)").html(material.guige);
                $(tr_template).children("td:eq(4)").html(material.yanse);
                $(tr_template).children("td:eq(5)").html(material.danwei);
                if(null!=material.materialCategory)
                    $(tr_template).children("td:eq(6)").html(material.materialCategory.name);
                $(tr_template).children("td:eq(7)").html(material.jinjia);
                tr_template.appendTo(tbody);
                var option=$(tr_template).children("td:eq(8)");
                var getInfo=$("<button></button>")
                getInfo.attr('button')
                getInfo.addClass('btn btn-xs btn-info');
                getInfo.on("click","location.href=/material?method=getMaterial&id="+material.id);
                getInfo.append("<span class='glyphicon glyphicon glyphicon-pencil'></span>");
                var remove=$("<button></button>");
                remove.attr('type','button')
                remove.addClass('btn btn-xs btn-danger');
                remove.on("click","location.href=/material?method=deleteMaterial&id="+material.id);
                remove.append("<span class='glyphicon glyphicon-remove'></span>");
                option.append(getInfo);
                option.append(remove);
            }
            //翻页
            var options = {
                currentPage:1,
                numberOfPages: 5,
                totalPages:0x7fffffff,
                size:"mini",
                bootstrapMajorVersion:3,
                alignment:"left",
                useBootstrapTooltip:true,
            onPageClicked: function(e,originalEvent,type,page){
                var pages = $(e.currentTarget).bootstrapPaginator("getPages");
                console.log(pages)
//                loadOnePage(10,pages.current);
            },
                shouldShowPage:function(type, page, current){
                    switch(type)
                    {
                        case "first":
                        case "last":
                            return false;
                        default:
                            return true;
                    }
                }
            }
//            $('#pagination').bootstrapPaginator(options);
            $('#material_tb').tablePagination({});

        }).fail(function(jqXHR,textStatus){
//                alert("Request failed:"+textStatus);
        });
    }

    $(document).ready(function(){
        loadOnePage(1000,0);//装载第一页
    });
</script>

<div class="panel panel-success">
    <div class="panel-heading panel-info">
        <h3 class="panel-title">材料列表</h3>
    </div>
    <div class="panel-body">
        <div >
            <table id="material_tb" class="table-bordered table-hover table-condensed" width="80%">
                <thead>
                <tr>
                    <th style="width: 30px"><input id="checkAll1" class="checkbox-contorl" type="checkbox" onclick=selectAll1()></th>
                    <th style="width: 30px">序号</th>
                    <th >材料名称</th>
                    <th style="width: 50px">规格</th>
                    <th style="width: 50px">颜色</th>
                    <th style="width: 50px">单位</th>
                    <th style="width: 50px">分类</th>
                    <th style="width: 50px">进价</th>
                    <th style="width: 100px">操作</th>
                </tr>
                </thead>
                <tbody>
                </tbody>
                <tfoot>
                <tr>
                    <th><input id="checkAll2" class="checkbox-contorl" type="checkbox" onclick="selectAll2()"></th>
                    <th colspan=9>
                        <div class="row" >
                            <div class="col-sm-2">
                                <button class="btn btn-sm btn-warning" >批量删除</button>
                            </div>
                            <div class="col-sm-8" id="panel-menu">
                                <%--<ul class="pagination pagination-sm">--%>
                                    <%--<li><a href="#">&laquo;</a></li>--%>
                                    <%--<li class="active"><a href="#">1</a></li>--%>
                                    <%--<li><a href="#">2</a></li>--%>
                                    <%--<li><a href="#">3</a></li>--%>
                                    <%--<li><a href="#">4</a></li>--%>
                                    <%--<li><a href="#">5</a></li>--%>
                                    <%--<li><a href="#">&raquo;</a></li>--%>
                                <%--</ul>--%>
                                <ul id="pagination">

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
