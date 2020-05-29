<%--
  Created by IntelliJ IDEA.
  User: smallmonkey
  Date: 2020/5/27
  Time: 15:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link href="../css/Manager.css" type="text/css" rel="stylesheet"/>
    <link href="../css/contentManger.css" type="text/css" rel="stylesheet"/>
</head>
<body>
<!-- 头部 -->
<div class="top1" style="text-align: center;">
    <ul>
        <li><a id="name" href="rootindex.jsp">xxx的博客</a></li>
        <li><a id="root" href="../index.jsp">退出管理</a></li>
        <li><a id="n1" href="#">关于我</a></li>
        <li><a id="n2" href="MessageManger.jsp">留言板</a></li>
        <li><a id="n3" href="EssayManger.jsp">随笔</a></li>
        <li><a id="n4" href="BlogManger.jsp">博客</a></li>
    </ul>
</div>
<div class="content">
    <div class="left">
        <div class="menu" style="width: 100%;height: auto;">
            <ul>
                <li id="add" style="float: left;width: 100%"><a href="#" title="待定">待定</a></li>
                <li style="float: left;width: 100%"><a href="#" title="待定">待定</a></li>
                <li style="float: left;width: 100%"><a href="#" title="待定">待定</a></li>
                <li style="float: left;width: 100%"><a href="#" title="待定">待定</a></li>
            </ul>
        </div>
    </div>
    <div class="right"></div>
</div>
</body>
</html>

