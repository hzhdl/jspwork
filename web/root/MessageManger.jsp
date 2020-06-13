<%@ page import="java.sql.ResultSet" %>
<%@ page import="blog.Blog" %>
<%@ page import="java.sql.Date" %>
<%@ page import="blog.Message" %><%--
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
                <li id="add" style="float: left;width: 100%"><a href="#" onclick="add()">添加评论</a></li>
                <li id="manbl" style="float: left;width: 100%"><a href="#" onclick="manager()">评论管理</a></li>
                <li style="float: left;width: 100%"><a href="#" onclick="find()">评论查询</a></li>
            </ul>
        </div>
        <div class="find" id="find" style="display:none;width: 90%;height:20px;position: relative;left: 15%;margin-top: 5px;top:8px;">
            <form action="MessageManger.jsp" id="findform" method="post">
                <input  id="key" type="text" name="key" placeholder="根据content模糊查询" style="width: 78%;border-radius: 5px;float: left"/></form>
            <a  href="#" style="text-decoration: none"><img src="../imgs/findb.png"  class="findpic" onclick="Find()" style="margin-left:5px;height: 100%;border-radius: 5px;float: left"/></a>
        </div>
    </div>
    <div class="right" style="width: 68%;">
        <%
            Message m= null;
            m = new Message();
            String key=request.getParameter("key");
            ResultSet res;
            if(key==null||key==""){
                res=m.getparentmessage();}
            else {
                res=m.LikeFind(key);
            }
            while(res.next()){
        %>
        <div class="message">
            <div class="mess-parent">
            <div class="mess-word">
                <div class="mess-content">热心网友：<%=res.getString(2)%></div>
            </div>
            <div class="mess-man">
                <input type="button"  class="bl-info1" onclick="Back('<%=res.getString(1)%>')" style="display: none;position: relative;bottom: 0px;left:0;" value="回复"/>
                <input type="button"  class="bl-info1" onclick="del('<%=res.getString(1)%>')" style="display: none;position: relative;bottom: 23px;left:10%;" value="删除"/>

            <div class="mess-time"><%=res.getString(3)%></div></div>
            </div>
            <div class="mess-child" style="">
                <%
                    Message m1= null;
                    m1 = new Message();
                    ResultSet r1;
                    r1=m1.getchildmessage(res.getString(1));
                    while(r1.next()){
                %>
                <div class="mess-parent">
                    <div class="mess-word">
                        <div class="mess-content">热心网友：<%=r1.getString(2)%></div>
                    </div>
                    <div class="mess-man">
                        <%--<input type="button"  class="bl-info1" onclick="" style="display: none;position: relative;bottom: 0px;left:0;" value="修改"/>--%>
                        <input type="button"  class="bl-info1" onclick="del('<%=r1.getString(1)%>')" style="display: none;position: relative;bottom:0;left:0" value="删除"/>

                    <div class="mess-time1"><%=r1.getString(3)%></div></div>
                </div>
                <%
                    }
                    r1.close();
                    m1.del();
                %>
            </div>
        </div>
        <%
            }
            res.close();
            m.del();
        %>
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
    <form id="tj" action="../OpMessage">
        <p>评论：<input type="text" id="mess" name="mess"/></p>
        <input type="text" id="flag" name="flag" hidden/>
        <input type="text" id="par" name="par" hidden/>
        <div style="float:right;">
            <input type="button" class="my-btn-gray" onclick="create_paper_cancel()" value="取消"></input>
            <input type="button" class="my-btn-blue" onclick="create_paper_save()" value="保存"></input>
        </div>
    </form>
</div>
<script type="text/javascript">
    var flagmanbl=0;
    var flagmanfind=0;
    function manager() {
        if(flagmanbl==0){
            var tmp=document.getElementsByClassName('bl-info1');
            var tmp1=document.getElementsByClassName('mess-time');
            var tmp2=document.getElementsByClassName('mess-time1');
            var i,j,k;
            for(j = 0; j < tmp.length; j++){
                tmp[j].style.display="block";
            }
            for(i = 0; i < tmp1.length; i++){
                tmp1[i].style.bottom="46";
            }
            for(k = 0; k < tmp2.length; k++){
                tmp2[k].style.bottom="23";
            }
            flagmanbl=1;
        }
        else{
            var tmp=document.getElementsByClassName('bl-info1');
            var tmp1=document.getElementsByClassName('mess-time');
            var tmp2=document.getElementsByClassName('mess-time1');
            var i,j,k;
            for(j = 0; j < tmp.length; j++){
                tmp[j].style.display="none";
            }
            for(i = 0; i < tmp1.length; i++){
                tmp1[i].style.bottom="auto";
            }
            for(k = 0; k < tmp2.length; k++){
                tmp2[k].style.bottom="0";
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
    function Find() {
        var tj=document.getElementById('findform');
        tj.submit();
    }
    function add() {
        document.getElementById('c1').style.display="block";
        document.getElementById('my_dialog').style.display="block";
        document.getElementById('par').value="";
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
        document.getElementById('mess').value=key;
        document.getElementById('flag').value=0;
        var tj=document.getElementById('tj');
        tj.submit();
    }
    function Back(par) {
        document.getElementById('c1').style.display="block";
        document.getElementById('my_dialog').style.display="block";
        document.getElementById('par').value=par;
    }
</script>
</body>
</html>

