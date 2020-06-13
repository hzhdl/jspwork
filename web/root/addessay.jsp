<%--
  Created by IntelliJ IDEA.
  User: smallmonkey
  Date: 2020/6/11
  Time: 8:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh">
<head>
    <title>添加博客</title>
    <link rel="stylesheet" href="../editor.md-master/examples/css/style.css" />
    <link rel="stylesheet" href="../editor.md-master/css/editormd.css" />
    <link rel="shortcut icon" href="https://pandao.github.io/editor.md/favicon.ico" type="image/x-icon" />
</head>
<body>
<div id="layout">
    <header>
        <h1>XXX的个人博客</h1>
    </header>
    <div class="head" style="float: left;background: #96e2ff;width: 100%; height: auto">
        <button id="gethtml" onclick="showdiv()" style="height: 30px;float: right;margin: 5px">保存</button>
        <button href="#" style="height: 30px;float: right;margin: 5px">上传图片</button><%--  功能暂定，后续开发  --%>

    </div>
    <div id="test-editormd">
        <form>
                <textarea id="tet" style="display:none;">
</textarea></form>
    </div>
</div>
<script src="../editor.md-master/examples/js/jquery.min.js"></script>
<script src="../editor.md-master/editormd.min.js"></script>
<script type="text/javascript">
    var testEditor;

    $(function() {
        testEditor = editormd("test-editormd", {
            width: "90%",
            height: 640,
            syncScrolling : "single",
            path : '../editor.md-master/lib/',
            saveHTMLToTextarea : true,
            /*theme : "dark",
            previewTheme : "dark",
            editorTheme : "pastel-on-dark",
            //markdown : md,
            codeFold : true,
            //syncScrolling : false,
            saveHTMLToTextarea : true,    // 保存 HTML 到 Textarea
            searchReplace : true,
            //watch : false,                // 关闭实时预览
            htmlDecode : "style,script,iframe|on*",            // 开启 HTML 标签解析，为了安全性，默认不开启
            //toolbar  : false,             //关闭工具栏
            //previewCodeHighlight : false, // 关闭预览 HTML 的代码块高亮，默认开启
            emoji : true,
            taskList : true,
            tocm            : true,         // Using [TOCM]
            tex : true,                   // 开启科学公式TeX语言支持，默认关闭
            flowChart : true,             // 开启流程图支持，默认关闭
            sequenceDiagram : true,       // 开启时序/序列图支持，默认关闭,
            //dialogLockScreen : false,   // 设置弹出层对话框不锁屏，全局通用，默认为true
            //dialogShowMask : false,     // 设置弹出层对话框显示透明遮罩层，全局通用，默认为true
            //dialogDraggable : false,    // 设置弹出层对话框不可拖动，全局通用，默认为true
            //dialogMaskOpacity : 0.4,    // 设置透明遮罩层的透明度，全局通用，默认值为0.1
            //dialogMaskBgColor : "#000", // 设置透明遮罩层的背景颜色，全局通用，默认为#fff
            imageUpload : true,
            imageFormats : ["jpg", "jpeg", "gif", "png", "bmp", "webp"],
            //imageUploadURL : "./php/upload.php",
            onload : function() {
                console.log('onload', this);
                //this.fullscreen();
                //this.unwatch();
                //this.watch().fullscreen();

                //this.setMarkdown("#PHP");
                //this.width("100%");
                //this.height(480);
                //this.resize("100%", 640);
            }
*/
        });

        /*
        // or
        testEditor = editormd({
            id      : "test-editormd",
            width   : "90%",
            height  : 640,
            path    : "../lib/"
        });
        */
    });
    /*function tijiao(){
        var htmlco = testEditor.getHTML();
        //alert(htmlco);
        $.ajax(
            {data:{
                te:htmlco,

                },
                dataType:'text',
                success: function(data){
                    alert(data);
                },
                type:'post',
                url:'../SaveBlog'
            }
        )
        //window.location.href="../saveblog"
    }*/
</script>

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
    <form id="tj" action="../SaveEssay">
        <p>标题：<input type="text" id="tittle" name="tittle"/></p>
        <p>摘要：<input type="text" id="summary" name="summary"/></p>
        <p>标签：<input type="text" id="tips" name="tips"/></p>
        <input type="text" id="te" name="te" hidden/>
        <div style="float:right;">
            <input type="button" class="my-btn-gray" onclick="create_paper_cancel()" value="取消"></input>
            <input type="button" class="my-btn-blue" onclick="create_paper_save()" value="保存"></input>
        </div>
    </form>
</div>
<script src="https://cdn.jsdelivr.net/npm/marked/marked.min.js"></script>
<script type="text/javascript">
    function showdiv(){
        document.getElementById('my_dialog').style.display="block";
        document.getElementById('c1').style.display="block";
    }

    function create_paper_cancel(){
        document.getElementById('my_dialog').style.display="none";
        document.getElementById('c1').style.display="none";
    }
    function create_paper_save(){
        document.getElementById('my_dialog').style.display="none";
        document.getElementById('c1').style.display="none";
        var htmlco = testEditor.getMarkdown();
        //var htmlco = document.getElementById('tet').value;
        var s = document.getElementById('summary').value;
        var ti = document.getElementById('tips').value;
        var t = document.getElementById('tittle').value;
        //var tj=document.getElementById('tj');
        /*var converter = new showdown.Converter();
        //进行转换
        var html = converter.makeHtml(htmlco);*/

        // var html=marked(htmlco);
        //htmlco.replaceAll('\n',"\r\n");
        //alert(htmlco);
        //htmlco.replace("\n","\r\n");
        //document.getElementById('te').value=htmlco;
        $.ajax(
            {data:{
                    te:htmlco,
                    tittle:t,
                    summary:s,
                    tips:ti,
                },
                dataType:'text',
                success: function(){
                    alert("save successful！");
                    window.location.href="EssayManger.jsp";
                },
                error:function(){
                    alert("save failed！");
                },
                type:'post',
                url:'../SaveEssay'
            }
        )

        //tj.method="post";
        //tj.submit();
    }

</script>
</body>
</html>