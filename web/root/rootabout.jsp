<%@ page import="blog.Blog" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Date" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link href="../css/head.css" type="text/css" rel="stylesheet"/>
    <link href="../css/content.css" type="text/css" rel="stylesheet"/>
    <link href="../css/rightBl.css" type="text/css" rel="stylesheet"/>
    <style>
        html, body {
            margin: 0;
            padding: 0;
            background-color: #29454d;
            /*禁止文字被选中*/
            -moz-user-select: none;
            /*火狐*/
            -webkit-user-select: none;
            /*webkit浏览器*/
            -ms-user-select: none;
            /*IE10*/
            -khtml-user-select: none;
            /*早期浏览器*/
            user-select: none;
            overflow: hidden;
        }

        .box {
            position: relative;
            height: 500px;
            width: 500px;
            margin: 100px auto;
            transform-style: preserve-3d;
            perspective: 2000px;
        }

        .di {
            position: absolute;
            left: 50%;
            top: 50%;
            height: 200px;
            width: 200px;
            transform: translate(-50%, -50%) rotatex(90deg);
            transform-style: preserve-3d;
        }

        .z {
            position: relative;
            height: 200px;
            width: 200px;
            border-radius: 50%;
            transform-style: preserve-3d;
            /*transform: rotatez(1deg);*/
        }

        p {
            margin: 0;
            position: absolute;
            top: 0;
            /*为了保证圆心在父盒子中心，父盒子旋转时圆心稳定，所以设置left*/
            left: 25px;
            height: 200px;
            width: 150px;
            border: 2px solid #fd7068;
            box-sizing: border-box;
            background-color: #ffffff;
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
            /*opacity: .7;*/
            font-size: 20px;
            line-height: 40px;
            text-align: center;
            /*box-shadow: 0 0 100px #16ff8b;*/
            /*倒影，不兼容*/
            -webkit-box-reflect: below 10px -webkit-linear-gradient(top, rgba(250, 250, 250, 0), rgba(250, 250, 250, .0) 30%, rgba(250, 250, 250, 0.5));
            box-reflect: below 10px -webkit-linear-gradient(top, rgba(250, 250, 250, 0), rgba(250, 250, 250, .0) 30%, rgba(250, 250, 250, 0.5));
            /*backface-visibility: hidden;*/
        }
    </style>

</head>
<body>
<!-- 头部 -->
<div class="top1"style="text-align: center;">
    <ul>
        <li><a id="name" href="rootindex.jsp">xxx的博客</a></li>
        <li><a id="root" href="../index.jsp">退出管理</a></li>
        <li><a id="n1" href="rootabout.jsp">关于我</a></li>
        <li><a id="n2" href="MessageManger.jsp">留言板</a></li>
        <li><a id="n3" href="EssayManger.jsp">随笔</a></li>
        <li><a id="n4" href="BlogManger.jsp">博客</a></li>
    </ul>
</div>



<div class="box">
    <div class="di">
        <div class="z">
            <p>侯志豪
                负责：
                后端事务的处理
                页面框架的搭建
                数据库设计实现
            </p>
            <p>黑光辉
                负责：
                前端页面的编写
                前端样式的设计
                PPT制作和整理
            </p>
            <p>韩根旺
                负责：
                前端页面的编写
                资源搜集和整理
                PPT制作和整理
            </p>
        </div>
    </div>
</div>
<script>
    window.onload = function () {
        setPs();
        move();
        drop();
    }
    //给每个p标签设置位置
    function setPs() {
        var ps = document.getElementsByTagName('p');
        for (var i = 0; i < ps.length; i++) {
            ps[i].style.transform = 'rotatex(-90deg) rotatey(' + i * 120 + 'deg) translatez(300px)'
        }
    }
    //鼠标拖动旋转
    function move() {
        var zBox = document.querySelector('.z');
        var xBox = document.querySelector('.di');
        //声明计算鼠标移动速度用的变量
        var speedTimer = null;
        var speedX = 0;
        var speedY = 0;
        //声明记录旋转角度的两个变量
        var xDegNow = 90;
        var zDegNow = 0;
        //声明变量记录要旋转的角度
        var xDegDistance = 0;
        var zDegDistance = 0;
        //声明变量记录是否发生鼠标移动事件
        var isMove = false;
        window.onmousedown = function (e) {
            //鼠标按下
            //清除过渡属性
            xBox.style.transition = '';
            zBox.style.transition = '';
            //记录按下的坐标以及计算速度的初始坐标
            var xstart = e.clientX;
            var speedX_start = xstart;
            var ystart = e.clientY;
            var speedY_start = ystart;
            //记录用来计算速度的初始时间
            var tstart = new Date().getTime();
            var tnow = tstart;
            //设置计时器更新计算速度的当时时间
            speedTimer = setInterval(function () {
                tnow = new Date().getTime();
            },10)
            window.onmousemove = function (e) {
                //鼠标移动
                isMove = true;
                //记录当时的坐标计算距离
                var xnow = e.clientX;
                var ynow = e.clientY;
                var xDistance = xnow - xstart;
                var yDistance = ynow - ystart;
                //如果计时超过一定时间（10毫秒），计算速度
                if (tnow - tstart >= 10) {
                    //速度=（现在的坐标-初始坐标）/（现在时间-初始时间）
                    speedX = (xnow - speedX_start) / (tnow - tstart);
                    speedY = (ynow - speedY_start) / (tnow - tstart);
                    //让初始时间和坐标等于现在的时间和坐标
                    tstart = tnow;
                    speedX_start = xnow;
                    speedY_start = ynow;
                }
                //把鼠标移动距离计算成角度后设置到页面上
                zDegDistance = zDegNow - (xDistance / 10);
                zBox.style.transform = 'rotatez(' + zDegDistance + 'deg)';
                xDegDistance = xDegNow - (yDistance / 10);
                xDegDistance = xDegDistance > 179 ? 179 : xDegDistance < 1 ? 1 : xDegDistance;
                xBox.style.transform = 'translate(-50%,-50%) rotatex(' + xDegDistance + 'deg)';
            };
        };
        window.onmouseup = function (e) {
            //鼠标松开
            //清除计时器 清除鼠标移动事件
            clearTimeout(speedTimer);
            window.onmousemove = null;
            //判断如果发生移动
            if (isMove) {
                //添加过渡属性
                xBox.style.transition = 'all 0.5s ease-out';
                zBox.style.transition = 'all 0.5s ease-out';
                //根据速度计算目标角度，设置到页面上
                zDegDistance = zDegDistance - (speedX * 10);
                zBox.style.transform = 'rotatez(' + zDegDistance + 'deg)';
                xDegDistance = xDegDistance - (speedY * 10);
                xDegDistance = xDegDistance > 179 ? 179 : xDegDistance < 1 ? 1 : xDegDistance;
                xBox.style.transform = 'translate(-50%,-50%) rotatex(' + xDegDistance + 'deg)';
                //记录当前角度的值更新
                xDegNow = xDegDistance;
                zDegNow = zDegDistance;
                //用到的变量重置
                isMove = false;
                speedX = 0;
                speedY = 0;
                xDegDistance = 0;
                zDegDistance = 0;
            }
        };

    }


</script>
</body>
</html>
