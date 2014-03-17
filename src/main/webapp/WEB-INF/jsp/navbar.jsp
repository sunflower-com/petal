<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<nav class="navbar navbar-inverse" role="navigation">
<ul class="nav nav-pills">
    <li class="active"><a href="/index">主页</a></li>
    <li class="dropdown">
        <a class="dropdown-toggle" data-toggle="dropdown" href="#">
            基础信息 <span class="caret"></span>
        </a>
        <ul class="dropdown-menu">
            <li ><a href="/basicInfo/material">材料</a></li>
            <li ><a href="/basicInfo/product">产品</a></li>
            <li><a href="/basicInfo/user">用户</a></li>
        </ul>
    </li>
    <li class="dropdown">
        <a class="dropdown-toggle" data-toggle="dropdown" href="#">
            预生产 <span class="caret"></span>
        </a>
        <ul class="dropdown-menu">
            <li><a href="/production/assembly">组装单</a></li>
        </ul>
    </li>
    <li class="dropdown">
        <a class="dropdown-toggle" data-toggle="dropdown" href="#">
            预算 <span class="caret"></span>
        </a>
        <ul class="dropdown-menu">
            <li><a href="/budget/material">材料成本</a></li>
            <li><a href="/budget/sell">销售利润</a></li>
        </ul>
    </li>
</ul>
</nav>

