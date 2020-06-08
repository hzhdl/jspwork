<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.io.FileReader" %><%--
  Created by IntelliJ IDEA.
  User: smallmonkey
  Date: 2020/5/27
  Time: 15:23
  To change this template use File | Settings | File Templates.
--%>
<!DOCTYPE>
<html lang="zh">
<head>
    <meta charset="utf-8" />
    <title>Simple example - Editor.md examples</title>
    <link rel="stylesheet" href="editor.md-master/examples/css/style.css" />
    <link rel="stylesheet" href="editor.md-master/css/editormd.css" />
</head>
<body>
<div style="margin-left: 100px;width: 90%" id="test-editormd">
    　　　　<textarea style="display:none;"><%
    String path=request.getServletContext().getRealPath("/");
    String num="25";
    FileReader fr=new FileReader(path+"Blog/blog"+num+".txt");
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
</body>
</html>