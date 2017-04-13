<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>个人空间</title>
    <link href="../css/bootstrap.css" rel="stylesheet">
    <link href="../css/common/navbar.css" rel="stylesheet">
    <link href="../css/common/common.css" rel="stylesheet">
    <link href="../css/info.css" rel="stylesheet">
    <script src="../js/jquery-3.1.1.min.js"></script>
    <script src="../js/bootstrap.js"></script>
    <script src="../js/info.js"></script>
</head>
<body>
    <%@include file="first/navBar.jsp"%>

    <div class="container-fluid main-content">
        <div class="row content-row">
            <div class="row list-row input-row"> 
                <div class="title">
                    <span>基础资料</span>
                </div>
                <div class="row info-row">
                    <div class="row short-row">
                        <img src="../img/common/user.jpg" alt="" class="imgObj">
                        <p>修改头像</p>
                        <input class="uploadImg">
                    </div>
                    <div class="row long-row">
                        <div class="item">
                            <span class="n">昵称：</span>
                            <input type="text" class="reg-input info-input" id="info-name" name="name" value="${info.name}昵称" disabled="disabled">
                        </div>
                        <div class="item">
                            <span class="n">签名：</span>
                            <input type="text" class="reg-input info-input" id="info-des" name="des" value="个人介绍写点啥行不行? " disabled="disabled">
                        </div>
                        <div class="item">
                            <span class="n">年龄：</span>
                            <input type="text" class="reg-input info-input" id="info-age" name="age" value="${info.age}20" disabled="disabled">
                        </div>
                        <div class="item">
                            <span class="n">地址：</span>
                            <input type="text" class="reg-input info-input" id="info-address" name="address" value="${info.address}江苏省南京市" disabled="disabled">
                        </div>
                        <div class="item">
                            <span class="n" style="margin-left:58px;">等级：&nbsp&nbsp&nbsplevel1</span>
                        </div>
                    </div>
                    <div class="row operate-info">
                        <div class="errorMsg nicknameError" id="error-dynamic-info">
                        </div>
                        <span class="border-btn btn-first" onclick="modifyInfo()">修改资料</span>
                        <span class="border-btn btn-second" onclick="modifyInfoSave()">确认修改</span>
                        <span class="border-btn btn-second" onclick="modifyCancel()">取消修改</span>
                    </div>
                </div>
            </div>

            <div class="row list-row choose-row modify-psw-row">
                <div class="title">
                    <span>修改密码</span>
                </div>
                <br>
                <div class="row dynamic-info">
                    <div class="item">
                        <span class="n long-n">请输入原密码：</span>
                        <input type="password" class="reg-input long" id="modify-psw-password" name="nickname">
                    </div>
                    <div class="item">
                        <span class="n long-n">请输入新密码：</span>
                        <input type="password" class="reg-input long" id="modify-psw-password-new" name="nickname">
                    </div>
                    <div class="item">
                        <span class="n long-n">请再次输入新密码：</span>
                        <input type="password" class="reg-input long" id="modify-psw-password-new-again" name="nickname">
                    </div>
                    <div class="row operate-info">
                        <div class="errorMsg nicknameError" id="error-modify-psw">
                        </div>
                        <span class="border-btn" onclick="modifyPswSave()">修改密码</span>
                        <span class="border-btn" onclick="modifyCancel()">取消修改</span>
                    </div>
                </div>
            </div>

            <div class="row list-row safe-row">
                <div class="title">
                    <span>账号安全</span>
                </div>
                <div class="bd account-security">
                    <div class="item">
                        <div class="email-wrapper">
                            <i class="uqer-ic lock reg-m"></i>
                            <div class="mid">
                                <div>
                                    <span class="t">登录密码</span><span class="curPwd">******</span>
                                </div>
                                <p>用于保护帐号信息和登录安全</p>
                            </div>
                            <span class="border-btn resetPwd" onclick="modifyPsw()">修改</span>
                        </div>
                    </div>

                    <div class="item">
                        <div class="tel-wrapper">
                            <i class="uqer-ic mobile reg-m"></i>
                            <div class="mid">
                                <div>
                                    <span class="t">手机号码</span>
                                </div>
                                <p>尚未绑定手机</p>
                            </div>
                            <span class="border-btn bind">绑定</span>
                        </div>
                    </div>
                    <div class="item">
                        <div class="tel-wrapper">
                            <i class="uqer-ic email reg-m"></i>
                            <div class="mid">
                                <div>
                                    <span class="t">邮箱</span>
                                </div>
                                <p>尚未绑定邮箱</p>
                            </div>
                            <span class="border-btn bind">绑定</span>
                        </div>
                    </div>

                    <div class="item" style="border-bottom: none;">
                        <div class="tel-wrapper">
                            <i class="uqer-ic wechat reg-m"></i>
                            <div class="mid">
                                <div>
                                    <span class="t">微信</span>
                                </div>
                                <p>尚未绑定微信</p>
                            </div>
                            <span class="border-btn bind">绑定</span>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>


</body>
</html>
