<%@ page import="java.sql.ResultSet" %>
<%@ page import="blog.Blog" %>
<%@ page import="java.sql.Date" %>
<%@ page import="blog.Tip" %><%--
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
    <link href="../css/rightBl.css" type="text/css" rel="stylesheet"/>
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
    <div class="left" style="width: 30%;">
        <div class="menu" >
            <ul>
                <li id="add" style="float: left;width: 100%"><a href="#" onclick="add()">添加标签</a></li>
                <li  style="float: left;width: 100%"><a href="BlogManger.jsp" onclick="">返回博客管理</a></li>
                <%--<li id="manbl" style="float: left;width: 100%"><a href="#" onclick="delall()">批量删除</a></li>--%>
            </ul>
        </div>
    </div>
    <div class="right" style="width: 68%;">
        <div id="tiphead" style="width: 80%; height:auto;position: relative;left: 10%;clear: both;background-color: white;border-radius: 5px">

        </div>
        <table style="width: 80%;position: relative;left: 10%;clear: both;" cellspacing="0">
            <%
            Tip t=new Tip();
            ResultSet res=t.getall();
            while(res.next()){
        %>
            <tr>
                <td><input type="checkbox" value="<%=res.getString(1)%>"></td>
                <td class="tips"><%=res.getString(1)%></td>
                <td><input type="button" value="删除" onclick="del('<%=res.getString(1)%>')"/></td>
            </tr><%
            }
            %>
        </table>

    </div>
</div>
<div id="c1" class="c" style="display: none;position: fixed;
            left: 0;
            top: 0;
            right: 0;
            bottom: 0;
            background-color: black;
            opacity: 0.6;
            z-index: 100;"></div>
<div id="my_dialog" class="m" style="display: none;width: 500px;
            height: 400px;
            background-color: white;
            position: fixed;
            left: 50%;
            top: 50%;
            margin-left: -250px;
            margin-top: -200px;
            z-index: 101;" >
    <form id="tj" action="../OpTips">
        <p>标签名称：<input type="text" id="tip" name="tip"/></p>
        <input type="text" id="flag" name="flag" hidden/>
        <div style="float:right;">
            <input type="button" class="my-btn-gray" onclick="create_paper_cancel()" value="取消"></input>
            <input type="button" class="my-btn-blue" onclick="create_paper_save()" value="保存"></input>
        </div>
    </form>
</div>
<script type="text/javascript">
    var flagmanbl=0;
    var flagmanfind=0;
    function add() {
        document.getElementById('c1').style.display="block";
        document.getElementById('my_dialog').style.display="block";
    }
    function create_paper_cancel(){
        document.getElementById('my_dialog').style.display="none";
        document.getElementById('c1').style.display="none";
    }
    function create_paper_save(){
        document.getElementById('my_dialog').style.display="none";
        document.getElementById('c1').style.display="none";
        var tj=document.getElementById('tj');
        document.getElementById('flag').value=1;
        tj.submit();
    }
    function del(key) {
        document.getElementById('tip').value=key;
        document.getElementById('flag').value=0;
        var tj=document.getElementById('tj');
        tj.submit();
    }
</script>
</body>
</html>

