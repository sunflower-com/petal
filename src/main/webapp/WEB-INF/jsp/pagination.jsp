<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="jstl.jsp" %>
<jsp:include page="meta.jsp"/>
<s:if test="#request.pagination.totalPage>0">
    <div class="pageDiv" id="pageDiv">
        <!-- 总记录数
    	<span>${pagination.totalRow}</span>-->
        <!-- 当前页/总页数
    	<span>${pagination.currentPage}/${pagination.totalPage}</span>-->
        <!-- 当前页不是第一页时生成首页和上一页 -->
        <c:if test="${pagination.currentPage>1}">
            <span onclick="doPage('1')"><a>首页</a></span>
            <span onclick="doPage('pre')"><a>« 上一页</a></span>
        </c:if>
        <!-- 计算要分几次显示页码，每次显示10页 -->
        <c:choose>
            <c:when test="${pagination.totalPage %10 > 0}">
                <c:set var="count" value="${pagination.totalPage/pagination.pageSize+1}" />
            </c:when>
            <c:otherwise>
                <c:set var="count" value="${pagination.totalPage/pagination.pageSize}" />
            </c:otherwise>
        </c:choose>
        <!-- count > 1 -->
        <c:choose>
            <c:when test="${count - 1 > 1}">
                <!-- 1~10页先生成 -->
                <label id="p_1" class="cruLabel">
                    <c:forEach var="p" begin="1" end="10">
                        <span onclick="doPage('${p}')" <c:if test="${p==pagination.currentPage}">class='selected'</c:if>><a>${p}</a></span>
                    </c:forEach>
                    <span onclick="doPageLabel('p_2')"><a> »</a></span>
                </label>
                <c:forEach var="index" begin="2" end="${count}">
                    <label id="p_${index}" class="hideLabel">
                        <span onclick="doPageLabel('p_${index-1}')"><a>« </a></span>
                        <c:forEach items="${pagination.pages}" var="page" begin="${(index-1)*pagination.pageSize}" end="${index*pagination.pageSize-1}">
                            <c:if test="${page>10}">
                                <span onclick="doPage('${page}')" <c:if test="${page==pagination.currentPage}">class='selected'</c:if>><a>${page}</a></span>
                            </c:if>
                        </c:forEach>
                        <c:if test="${count - index > 1}">
                            <span onclick="doPageLabel('p_${index+1}')"><a> »</a></span>
                        </c:if>
                    </label>
                </c:forEach>
            </c:when>
            <c:otherwise>
                <c:forEach items="${pagination.pages}" var="page">
                    <span onclick="doPage('${page}')" <c:if test="${page==pagination.currentPage}">class='selected'</c:if>><a>${page}</a></span>
                </c:forEach>
            </c:otherwise>
        </c:choose>
        <!-- 当前页不是最后页时生成下一页 末页 -->
        <c:if test="${pagination.currentPage!=pagination.totalPage}">
            <span onclick="doPage('next')"><a>下一页 »</a></span>
            <!--	<span onclick="doPage('${pagination.totalPage}')"><a>末页</a></span>-->
        </c:if>
        <!--<span>转到</span>
    	<select id="to_p">
    		<c:forEach items="${pagination.pages}" var="tp">
    			<option value="${tp}"
    				<c:if test="${tp eq pagination.currentPage}">
    				selected="selected"
    				</c:if>
    			>${tp}</option>
    		</c:forEach>
    	</select>
    	<span>页</span>
    	<span onclick="doPage(document.getElementById('to_p').value)">确定</span>-->
    </div>
</s:if>
<script type="text/javascript">
    /*** 翻页*/
    function doPage(page){
        var form=document.forms[0];
        if('${pagination.currentPage}'===page){
            return;
        }else if("next"===page){
            if('${pagination.currentPage}'=='${pagination.totalPage}')return;
            form.action='<s:url />?pagination.currentPage='+(new Number('${pagination.currentPage}')+1);
        }else if("pre"===page){
            if('${pagination.currentPage}'==1)return;
            form.action='<s:url />?pagination.currentPage='+(new Number('${pagination.currentPage}')-1);
        }else {
            form.action='<s:url />?pagination.currentPage='+page;
        }
        form.submit();
    }
</script>
