<%--
  Created by IntelliJ IDEA.
  User: smallmonkey
  Date: 2020/6/15
  Time: 8:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.io.FileReader" %>
<%@ page import="blog.Blog" %>
<%@ page import="blog.Essay" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh">
<head>
    <meta charset="utf-8" />
    <title>个人博客</title>
    <link rel="stylesheet" href="editor.md-master/examples/css/style.css" />
    <link rel="stylesheet" href="editor.md-master/css/editormd.css" />
    <link href="css/head.css" type="text/css" rel="stylesheet"/>
    <link href="css/content.css" type="text/css" rel="stylesheet"/>
    <link href="css/rightBl.css" type="text/css" rel="stylesheet"/>
</head>
<body>
<div class="top1"style="text-align: center;height: 40px;font-size: 15px">
    <ul>
        <li><a id="name" href="index.jsp">xxx的博客</a></li>
        <li><a id="root" href="root/rootlogin.jsp">管理登录</a></li>
        <li><a id="n1" href="about.jsp">关于我</a></li>
        <li><a id="n2" href="Messageboard.jsp">留言板</a></li>
        <li><a id="n3" href="essay.jsp">随笔</a></li>
        <li><a id="n4" href="Blog.jsp">博客</a></li>
    </ul>
</div>
<div class="content">
    <div class="left" style="position: relative;
    margin-top: 60px;
    left: -10%;
}">
        <div style="margin-left: 100px;width: 90%" id="test-editormd">
            　　　　<textarea>
<%
    String path=request.getServletContext().getRealPath("/");
    String num=request.getParameter("te");
    Essay b=new Essay();
    String p=b.Findpath(num);
    FileReader fr=new FileReader(path+p);
    int c=fr.read();
    while(c!=-1) {
        out.print((char)c);
        c=fr.read();
    }
    fr.close();
%></textarea>
        </div>
        <script src="editor.md-master/examples/js/jquery.min.js"></script>
        <script src="editor.md-master/lib/marked.min.js"></script>
        <script src="editor.md-master/lib/prettify.min.js"></script>
        <script src="editor.md-master/lib/raphael.min.js"></script>
        <script src="editor.md-master/lib/underscore.min.js"></script>
        <script src="editor.md-master/lib/sequence-diagram.min.js"></script>
        <script src="editor.md-master/lib/flowchart.min.js"></script>
        <script src="editor.md-master/lib/jquery.flowchart.min.js"></script>
        <script src="editor.md-master/editormd.js"></script>
        <script type="text/javascript">
            editormd.markdownToHTML("test-editormd", {
                htmlDecode      : "style,script,iframe",
                syncScrolling : "single",
                emoji           : true,
                taskList        : true,
                tex             : true,  // 默认不解析
                flowChart       : true,  // 默认不解析
                sequenceDiagram : true  // 默认不解析
            });
        </script>
    </div>
    <div class="right" style="margin-top: 60px;">
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
            <div class="menuimg"><img id="rssimg" src="imgs/pullblack.png"  onclick="rssshow()" style="left: 0"/></div>
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
