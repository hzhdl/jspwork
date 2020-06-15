<%@ page import="blog.Blog" %>
<%@ page import="java.sql.Date" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="blog.Message" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link href="css/head.css" type="text/css" rel="stylesheet"/>
    <link href="css/content.css" type="text/css" rel="stylesheet"/>
    <link href="css/rightBl.css" type="text/css" rel="stylesheet"/>
</head>
<body>
<!-- 头部 -->
<div class="top1"style="text-align: center;">
    <ul>
        <li><a id="name" href="index.jsp">xxx的博客</a></li>
        <li><a id="root" href="root/rootlogin.jsp">管理登录</a></li>
        <li><a id="n1" href="about.jsp">关于我</a></li>
        <li><a id="n2" href="Messageboard.jsp">留言板</a></li>
        <li><a id="n3" href="essay.jsp">随笔</a></li>
        <li><a id="n4" href="Blog.jsp">博客</a></li>
    </ul>
</div>
<div class='top2'style="text-align: center;">
    <h3 class='h1'style="text-align:center;line-height: 240px;width: 100%;color: whitesmoke;">凡心之所向 即锋之所指</h3>
    <p class='h4' style="text-align:center;line-height: 40px;width: 100%;color: whitesmoke;">The direction of the heart is the direction of the front</p>
</div>
<div class="content">
    <div class="left">
        <div class="blog-block" style="width: 100%;clear: both">
            <div class="head" >
                <span>个人博客</span>
                <a onclick="add()" class="messa-add" style="font-size: 15px;">留言</a>
                <hr/>
            </div>
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
            <div class="messa">
                <div class="messa-parent">
                    <div class="messa-word">
                        <div class="messa-content">@热心网友：<%=res.getString(2)%></div>
                    </div>
                    <div class="messa-man">
                        <div class="messa-time"><%=res.getString(3)%></div></div>
                </div>
                <div class="messa-child" style="">
                    <%
                        Message m1= null;
                        m1 = new Message();
                        ResultSet r1;
                        r1=m1.getchildmessage(res.getString(1));
                        while(r1.next()){
                    %>
                    <div class="messa-parent">
                        <div class="messa-word">
                            <div class="messa-content">站主回复：<%=r1.getString(2)%></div>
                        </div>
                        <div class="messa-man">
                            <div class="messa-time1"><%=r1.getString(3)%></div></div>
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
    <div class="right">
        <div class="menu" style="width: 100%;height: auto;">
            <div class="head">
                <span>rss热门信息</span>
            </div>
            <ul id="rssul" style="display: none">
                <li style="float: left;width: 100%"><a class="rss" href="#"></a></li>
                <li style="float: left;width: 100%"><a href="#" class="rss"></a></li>
                <li style="float: left;width: 100%"><a href="#" class="rss"></a></li>
                <li style="float: left;width: 100%"><a href="#" class="rss"></a></li>
                <li style="float: left;width: 100%"><a href="#" class="rss"></a></li>
                <li style="float: left;width: 100%"><a href="#" class="rss"></a></li>
                <li style="float: left;width: 100%"><a href="#" class="rss"></a></li>
                <li style="float: left;width: 100%"><a href="#" class="rss"></a></li>
                <li style="float: left;width: 100%"><a href="#" class="rss"></a></li>
                <li style="float: left;width: 100%"><a href="#" class="rss"></a></li>

            </ul>
            <div class="menuimg"><img id="rssimg" src="imgs/pullblack.png" onclick="rssshow()"/></div>
        </div>
        <div class="menu" style="width: 100%;height: auto;">
            <div class="head">
                <span>热门标签</span>
            </div>
            <ul>
                <li style="float: left;width: 100%"><a href="#">阿里云</a></li>
                <li style="float: left;width: 100%"><a href="#" >linux</a></li>
                <li style="float: left;width: 100%"><a href="#" >机器学习</a></li>
                <li style="float: left;width: 100%"><a href="#" >数据挖掘</a></li>
                <li style="float: left;width: 100%"><a href="#" >移动开发</a></li>
                <li style="float: left;width: 100%"><a href="#" >PHP</a></li>
                <li style="float: left;width: 100%"><a href="#" >OPENCV</a></li>
                <li style="float: left;width: 100%"><a href="#" >深度学习</a></li>
            </ul>
        </div>
        <%--<div class="menu" style="width: 100%;height: auto;">
            <div class="head">
                <span>热门评论</span>
            </div>
            <ul>
                <%
                    Message message=new Message();
                    ResultSet messr=message.getparentmessage();
                    int count=0;
                    while(messr.next()){
                %>
                <li style="float: left;width: 100%"><a href="#">热心网友：<%=messr.getString(2)%></a></li>

                <%
                            count++;
                        if(count>10){break;}
                    }
                    messr.close();
                    message.del();
                %>
            </ul>
        </div>--%>
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
<div id="my_dialog" class="m" style="display: none;width: 300px;
            height: 200px;
            background-color: #BDE9FF;
            text-align: center;
            border-radius: 10px;
            position: fixed;
            left: 50%;
            top: 50%;
            margin-left: -250px;
            margin-top: -200px;
            z-index: 101;" >
    <form id="tj" action="OpMessage">
        <p>评论：<input type="text" id="mess" name="mess"/></p>
        <input type="text" id="flag" name="flag" hidden/>
        <input type="text" id="par" name="par" hidden/>
        <input type="text" id="flag1" name="flag1" hidden/>
        <div style="position: relative;
    width: 40%;
    left: 30%;">
            <input type="button" class="my-btn-gray" onclick="create_paper_cancel()" value="取消"></input>
            <input type="button" class="my-btn-blue" onclick="create_paper_save()" value="保存"></input>
        </div>
    </form>
</div>
<script type="text/javascript">
    //背景控制
    var tmp=document.getElementsByClassName("recom");
    var t=tmp.length;
    var tt;
    if(t%3==0){
        tt=t/3;
    }
    else{
        tt=(t-(t%3))/3+1;}
    document.getElementById('cal').style.height=tt*300+20;
    //

    //图片加载
    var count=1;
    function pic() {
        var img=document.getElementsByClassName("recomimgs");
        var j;
        for(j = 0; j < img.length; j++){
            img[j].src="imgs/images/img"+count+".jpg";
            count++;
        }
    }
    /*function picblog() {
        var img1=document.getElementsByClassName("blogimgs");
        var j;
        for(j = 0; j < img1.length; j++){
            img1[j].src="../imgs/images/img"+count+".jpg";
            count++;
        }
    }*/
    pic();

    //RSS数据获取
    var result;
    function rssget() {
        var xmlhttp=new XMLHttpRequest();
        var url="http://api.bluereader.org/hot";
        var type="GET";//方法
        xmlhttp.open(type,url,true);//方法，接口，异步
        xmlhttp.send();//发送请求

        xmlhttp.onreadystatechange=function(){
            if(xmlhttp.status==200&&xmlhttp.readyState==4){
                result=JSON.parse(xmlhttp.response);
            }
        }
    }
    //var obj1 = eval(result);
    rssget();
    var flagrss=0;
    function rssshow() {
        if(flagrss==0){
            if(result==null){rssget();}
            var rsscon=document.getElementsByClassName("rss");
            for(var i=0;i<rsscon.length;i++){
                rsscon[i].innerHTML=result[i].title;
                rsscon[i].href=result[i].link;
            }
            flagrss=1;
            document.getElementById("rssul").style.display="block";
            document.getElementById("rssimg").src="imgs/pushblack.png";
        }
        else{
            flagrss=0;
            document.getElementById("rssul").style.display="none";
            document.getElementById("rssimg").src="imgs/pullblack.png";
        }
    }
    rssshow();
//留言处理
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
        document.getElementById('flag1').value=1;
        tj.submit();
    }


</script>
</body>
</html>
