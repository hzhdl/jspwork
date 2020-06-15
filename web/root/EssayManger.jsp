<%@ page import="java.sql.ResultSet" %>
<%@ page import="blog.Blog" %>
<%@ page import="java.sql.Date" %>
<%@ page import="blog.Essay" %><%--
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
        <li><a id="n1" href="rootabout.jsp">关于我</a></li>
        <li><a id="n2" href="MessageManger.jsp">留言板</a></li>
        <li><a id="n3" href="EssayManger.jsp">随笔</a></li>
        <li><a id="n4" href="BlogManger.jsp">博客</a></li>
    </ul>
</div>
<div class="content">
    <div class="left" style="width: 30%;">
        <div class="menu" >
            <ul>
                <li id="add" style="float: left;width: 100%"><a href="addessay.jsp">添加随笔</a></li>
                <li id="manbl" style="float: left;width: 100%"><a href="#" onclick="manager()">随笔管理</a></li>
                <li style="float: left;width: 100%"><a href="#" onclick="find()">随笔查询</a></li>
                <li style="float: left;width: 100%"><a href="#">随笔数据</a></li>   <%--功能开发暂留--%>
                <li style="float: left;width: 100%"><a href="#">评论管理</a></li>   <%--功能开发暂留--%>
            </ul>
        </div>
        <div class="find" id="find" style="display:none;width: 90%;height:20px;position: relative;left: 15%;margin-top: 5px;top:8px;">
            <form action="EssayManger.jsp" id="findform" method="post">
                <input  id="key" type="text" name="key" placeholder="根据tip和tittle模糊查询" style="width: 78%;border-radius: 5px;float: left"/></form>
            <a  href="#" style="text-decoration: none"><img src="../imgs/findb.png"  class="findpic" onclick="Find()" style="margin-left:5px;height: 100%;border-radius: 5px;float: left"/></a>
        </div>
    </div>
    <div class="right" style="width: 68%;">
        <%
            Essay b= null;
            b = new Essay();
            String key=request.getParameter("key");
            ResultSet res;
            if(key==null||key==""){
                res=b.check(new Date(new java.util.Date().getTime()),true);}
            else {
                res=b.LikeFind(key);
            }
            while(res.next()){
        %>
        <div class="bl">
            <div style="width: 100%;height: 90%">
                <div class="bl-img"><img class="recomimgs"/></div>
                <div class="bl-word">
                    <div class="bl-tittle"><a href="../ShowEssay.jsp?te=<%=res.getString(1)%>"><%=res.getString(2)%></a></div>
                    <div class="bl-summary"><a href="../ShowEssay.jsp?te=<%=res.getString(1)%>"><%=res.getString(5)%></a></div>
                </div>
            </div>
            <div class="bl-foot">
                <img class="bl-info" id="bl-tip" src="../imgs/tipb.png"/><span><%=res.getString(3)%></span>
                <img class="bl-info" id="bl-time" src="../imgs/timeb.png"/><span><%=res.getString(6)%></span>
                <img class="bl-info" id="bl-good" src="../imgs/goodb.png"/><span>点赞</span>
                <img class="bl-info" id="bl-watch" src="../imgs/watchb.png"/><span>人数</span>
                <a><input type="button"  class="bl-info1" onclick="" style="display: none;position: relative;bottom: 23px;right:-80%;" value="修改"/></a>
                <a><input type="button"  class="bl-info1" onclick="del(<%=res.getString(1)%>)" style="display: none;position: relative;bottom: 42px;right:-90%;" value="删除"/></a>
            </div>
        </div>
        <%
            }
            res.close();
            b.del();
        %>
    </div>
</div>
<script type="text/javascript">
    var flagmanbl=0;
    var flagmanfind=0;
    function manager() {
        if(flagmanbl==0){
            var tmp=document.getElementsByClassName('bl-info1');
            var j;
            for(j = 0; j < tmp.length; j++){
                tmp[j].style.display="block";
            }
            flagmanbl=1;
        }
        else{
            var tmp=document.getElementsByClassName('bl-info1');
            var j;
            for(j = 0; j < tmp.length; j++){
                tmp[j].style.display="none";
            }
            flagmanbl=0;
        }

    }
    function find() {

        if(flagmanfind==0){
            document.getElementById('find').style.display="block";
            flagmanfind=1;
        }
        else{
            document.getElementById('find').style.display="none";
            flagmanfind=0;
        }
    }
    function del(num){
        window.location.href="../DelEssay?num="+num;
    }
    function Find() {
        var tj=document.getElementById('findform');
        tj.submit();
    }

    var count=1;
    function pic() {
        var img=document.getElementsByClassName("recomimgs");
        var j;
        for(j = 0; j < img.length; j++){
            img[j].src="../imgs/images/img"+count+".jpg";
            count++;
        }
    }
    pic();
</script>
</body>
</html>

