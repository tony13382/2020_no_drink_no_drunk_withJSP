<%@ page import = "java.sql.*, java.util.*"%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@include file="pages/config.jsp" %>

<html lang="en">
<head>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>首頁</title>
    <link rel="stylesheet" href="assets/css/index.css" type="text/css">
    <link href="assets/css/basic_element.css" type="text/css" rel="stylesheet">
    <meta charset="utf-8">

</head>

<body>
    <div class="bg_area">
        <div class="bg_img">
            <img src="assets/images/page_element/bg_gold.jpg" width="100%">
            <div class="helf1">
                <div class="word_area">
                    <p class="upword">NO DRINK</p>
                    <p class="downword">NO DRUNK</p>
                </div>
            </div>
            <div class="helf2">
                <a href="pages/products.jsp">
                    <div class="ballon01">
                        <p class="ballon_locate">商品總覽</p>
                    </div>
                </a>
                <a href="pages/about_us.jsp">
                    <div class="ballon02">
                        <p class="ballon_locate">聯絡我們</p>
                    </div>
                </a>
                <a href="pages/knowledge.jsp">
                    <div class="ballon03">
                        <p class="ballon_locate">知識專區</p>
                    </div>
                </a>
                <a href="pages/register.jsp">
                    <div class="ballon04">
                        <p class="ballon_locate">註冊</p>
                    </div>
                </a>
                <a href="pages/login.jsp">
                    <div class="ballon05">
                        <p class="ballon_locate">登入</p>
                    </div>
                </a>
            </div>
            <div class="cleaner"></div>
        </div>
    </div>
</body>
</html>