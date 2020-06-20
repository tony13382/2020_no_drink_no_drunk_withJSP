<%@ page import = "java.sql.*, java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html style="background-color: #2A2A2A; min-height: 100vh;">

<head>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css"
        integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>管理員登入</title>
    <link rel="stylesheet" href="assets/css/index.css" type="text/css">
    <link href="../assets/css/basic_element.css" type="text/css" rel="stylesheet">
    <meta charset="utf-8">
</head>

<body>
    <section style="display: flexbox;">
        <div class="page_container">
            <div class="bg_block">
                <div class="block_container">
                    <form action="pages/managelogin.jsp">
                        <h2 class="block_title">
                            登入管理系統
                        </h2>
                        <div class="block_info_square">
                            <div class="block_row">
                                <p class="block_admin_info_title">
                                    信箱：
                                </p>
                                <input type="email" name="name">
                                <div class="cleaner"></div>
                                <p class="block_admin_info_title">
                                    密碼：
                                </p>
                                <input type="password" name="password">
                                <div class="cleaner"></div>
                            </div>
                            <div class="block_row">
                                <input type="submit" value="送出資料" class="btn_black">
                                <input type="reset" value="重設" class="btn_black">
                                <div class="cleaner"></div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </section>

    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
        integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
        crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"
        integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut"
        crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"
        integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k"
        crossorigin="anonymous"></script>
</body>

</html>
