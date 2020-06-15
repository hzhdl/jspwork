<%@ page import="blog.Blog" %>
<%@ page import="java.sql.Date" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
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
<div class="top1" style="text-align: center;">
    <ul>
        <li><a id="name" href="index.jsp">xxx的博客</a></li>
        <li><a id="root" href="root/rootlogin.jsp">管理登录</a></li>
        <li><a id="n1" href="about.jsp">关于我</a></li>
        <li><a id="n2" href="Messageboard.jsp">留言板</a></li>
        <li><a id="n3" href="essay.jsp">随笔</a></li>
        <li><a id="n4" href="Blog.jsp">博客</a></li>
    </ul>
</div>
<div class='top2' style="text-align: center;">
    <h3 class='h1' style="text-align:center;line-height: 240px;width: 100%;color: whitesmoke;">凡心之所向 即锋之所指</h3>
    <p class='h4' style="text-align:center;line-height: 40px;width: 100%;color: whitesmoke;">The direction of the heart is the direction of the front</p>
</div>
<div class="content">
    <div class="left">
        <div class="blog-block" style="width: 100%;clear: both">
            <div class="head" >
                <span>个人博客</span>
                <hr/>
            </div>
            <%
                Blog b= null;
                b = new Blog();
                ResultSet res=b.check(new Date(new java.util.Date().getTime()),true);
                while(res.next()){
            %>
            <div class="blog">
                <div style="width: 100%;height: 90%">
                    <div class="blog-img"><img class="recomimgs"/></div>
                    <div class="blog-word">
                        <div class="blog-tittle"><a href="ShowBlog.jsp?te=<%=res.getString(1)%>"><%=res.getString(2)%></a></div>
                        <div class="blog-summary"><a href="ShowBlog.jsp?te=<%=res.getString(1)%>"><%=res.getString(5)%></a></div>
                    </div>
                </div>
                <div class="blog-foot">
                    <img class="blog-info" id="blog-tip" src="imgs/tipb.png"/><span><%=res.getString(3)%></span>
                    <img class="blog-info" id="blog-time" src="imgs/timeb.png"/><span><%=res.getString(6)%></span>
                    <img class="blog-info" id="blog-good" src="imgs/goodb.png"/><span>99</span>
                    <img class="blog-info" id="blog-watch" src="imgs/watchb.png"/><span>3</span>
                </div>
            </div>
            <%
                }
                b.del();
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
<script type="text/javascript">
    //背景控制
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



</script>
</body>
</html>
