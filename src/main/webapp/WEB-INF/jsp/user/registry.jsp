<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"><html>
<html>
<head>
    <title></title>
    <jsp:include page="../meta.jsp"/>
</head>
<body>
<div class="tabbable">
<ul class="nav nav-tabs">
    <li class="active"><a href="#tab1" data-toggle="tab">个人用户</a></li>
    <li><a href="#tab2" data-toggle="tab">企业用户</a></li>
</ul>
<div class="tab-content">
<div class="tab-pane active" id="tab1">
    <form class="form-horizontal">
        <fieldset>
            <div id="legend-user" class="">
                <legend class="">个人注册</legend>
            </div>

            <div class="control-group">
                <label class="control-label" for="username">账户名</label>
                <div class="controls">
                    <input type="text" placeholder="" class="input-xlarge" id="username">
                </div>
            </div>
            <div class="control-group">
                <label class="control-label" for="passworld">密码</label>
                <div class="controls">
                    <input type="password" placeholder="" class="input-xlarge" id="passworld">
                </div>
            </div>

            <div class="control-group">
                <label class="control-label" for="confirmPsw">确认密码</label>
                <div class="controls">
                    <input type="password" placeholder="" class="input-xlarge" id="confirmPsw">
                </div>
            </div>
            <div class="control-group">
                <div class="controls">
                    <label class="checkbox">
                        <input type="checkbox" value="我已阅读并同意《用户注册协议》">
                        我已阅读并同意《用户注册协议》
                    </label>
                </div>
            </div>
            <div class="control-group">
                <label class="control-label"></label>
                <div class="controls">
                    <button class="btn btn-success">立即注册</button>
                </div>
            </div>

        </fieldset>
    </form>
</div>
<div class="tab-pane" id="tab2">
    <form class="form-horizontal">
        <fieldset>
            <div id="legend" class="">
                <legend class="">联系人</legend>
            </div>
            <div class="control-group">
                <label class="control-label" for="linkname">联系人姓名</label>
                <div class="controls">
                    <input type="text" placeholder="" class="input-xlarge" id="linkname">
                </div>
            </div>

            <div class="control-group">
                <label class="control-label">所在部门</label>
                <div class="controls">
                    <select class="input-xlarge">
                        <option>选择</option>
                        <option>市场部</option>
                        <option>采购部</option>
                        <option>人力资源部</option>
                        <option>总裁办</option>
                        <option>其他</option></select>
                </div>

            </div>

            <div class="control-group">
                <label class="control-label" for="landline-telephone">固定电话</label>
                <div class="controls">
                    <input type="text" placeholder="" class="input-xlarge" id="landline-telephone">
                </div>
            </div>

            <div class="control-group">
                <label class="control-label" for="phone">手机</label>
                <div class="controls">
                    <input type="text" placeholder="" class="input-xlarge" id="phone">
                </div>
            </div>

            <div class="control-group">
                <label class="control-label" for="email">联系人邮箱</label>
                <div class="controls">
                    <input type="text" placeholder="" class="input-xlarge" id="email">
                </div>
            </div>
        </fieldset>
        <fieldset>
            <div id="legend2" class="">
                <legend class="">公司信息</legend>
            </div>
            <div class="control-group">
                <label class="control-label" for="companyname">公司名称</label>
                <div class="controls">
                    <input type="text" placeholder="" class="input-xlarge" id="companyname">
                </div>
            </div>

            <div class="control-group">
                <label class="control-label">公司所在地</label>
                <div class="controls">
                    <select class="input-xlarge">
                        <option>选择</option>
                        <option>广州</option>
                        <option>深证</option>
                        <option>上海</option>
                        <option>北京</option></select>
                </div>
            </div>

            <div class="control-group">
                <!-- Text input-->
                <label class="control-label" for="companyAdd">公司地址</label>
                <div class="controls">
                    <input type="text" placeholder="" class="input-xlarge" id="companyAdd">
                </div>
            </div>
            <div class="control-group">
                <label class="control-label">采购类型</label>
                <div class="controls">
                    <label class="checkbox inline">
                        <input type="checkbox" value="家电">
                        家电
                    </label>
                    <label class="checkbox inline">
                        <input type="checkbox" value="办公耗材">
                        办公耗材
                    </label>
                </div>
            </div>

            <div class="control-group">
                <!-- Text input-->
                <label class="control-label" for="linkAdd">公司网址</label>
                <div class="controls">
                    <input type="text" placeholder="" class="input-xlarge" id="linkAdd">
                    <p class="help-block"></p>
                </div>
            </div>

            <div class="control-group">
                <!-- Select Basic -->
                <label class="control-label">企业人数</label>
                <div class="controls">
                    <select class="input-xlarge">
                        <option>10+</option>
                        <option>100+</option>
                        <option>1000+</option>
                        <option></option></select>
                </div>
            </div>

            <div class="control-group">
                <!-- Select Basic -->
                <label class="control-label">企业行业</label>
                <div class="controls">
                    <select class="input-xlarge">
                        <option>选择</option>
                        <option>互联网</option>
                        <option>房地产</option>
                        <option>金融</option></select>
                </div>
            </div>
            <div class="control-group">
                <!-- Select Basic -->
                <label class="control-label">公司性质</label>
                <div class="controls">
                    <select class="input-xlarge">
                        <option>选择</option>
                        <option>政府机关/事业单位</option>
                        <option>国营</option>
                        <option>私企</option>
                        <option>中外合资</option>
                        <option>外资</option>
                        <option>其他</option>
                        <option></option></select>
                </div>

            </div>

            <div class="control-group">
                <label class="control-label"></label>
                <div class="controls">
                    <!-- Multiple Checkboxes -->
                    <label class="checkbox">
                        <input type="checkbox" value=" 我已阅读并同意《用户注册协议》">
                        我已阅读并同意《用户注册协议》
                    </label>
                </div>

            </div>

            <div class="control-group">
                <label class="control-label"></label>
                <!-- Button -->
                <div class="controls">
                    <button class="btn btn-default">立即注册</button>
                </div>
            </div>
        </fieldset>
    </form>
</div>
</div>
</div>
</body>
</html>