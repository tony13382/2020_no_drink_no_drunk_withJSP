<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import = "java.sql.*" %>
<%@include file="counter.jsp" %>
<html>
<%if(session.getAttribute("email")==null)
{
 out.print("<script>alert('請先登入會員'); window.location='login.jsp' </script>");
}
else%>
<head>
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>我的最愛</title>
  <link rel="stylesheet" href="../assets/css/products.css" type="text/css">
  <link href="../assets/css/basic_element.css" type="text/css" rel="stylesheet">
  <meta charset="utf-8">
</head>

<body>
  <header>
    <a href="../index.jsp">
      <div class="header_logo">
        <img src="../assets/images/page_element/logo.png" style="width: 100%">
      </div>
    </a>
    <ul class="header_ul">
        <a href="products.jsp" style="float: left">
                <li class="header_li">商品總覽</li>
            </a>
            <a href="knowledge.jsp" style="float: left">
                <li class="header_li">知識專區</li>
            </a>
            <a href="about_us.jsp" style="float: left">
                <li class="header_li_focus">聯絡我們</li>
            </a>
    </ul>
    <%if(session.getAttribute("email")==null)
		{%>
        <div class="header_btn_area">
            <div class="header_member_logo">
                <a href="admin_info_center.jsp">
                    <img src="../assets/images/page_element/peoeple_whi.png" style="width: 100%;">
                </a>
            </div>
            <div class="header_cart_logo">
                <a href="shopping_cart_list.jsp">
                    <img src="../assets/images/page_element/cart.png" style="width: 100%;">
                </a>
            </div>
        </div>
        <div style="clear: both;"></div>
		<%} 
		else
		{%>
	    <div class="header_btn_area">
		    <div style="float:left; display:flex;">
			<p style="float:left; color:white; font-size:16px; padding:20px 20px; font-weight:bold;">
			  <%sql="SELECT Name FROM client WHERE Email='" +session.getAttribute("email")+"'" ;
					ResultSet name =  con.createStatement().executeQuery(sql);
					if(name.next()){
						out.print( "親愛的 "+name.getString("name")+",您好!");
					}%>
			</p>
			<a href="loginout.jsp"; style="float:left; color:white; font-size:16px; padding:20px 20px; font-weight:bold;">登出</a>
			</div>
            <div class="header_member_logo">
                <a href="admin_info_center.jsp">
                    <img src="../assets/images/page_element/peoeple_whi.png" style="width: 100%;">
                </a>
            </div>
            <div class="header_cart_logo">
                <a href="shopping_cart_list.jsp">
                    <img src="../assets/images/page_element/cart.png" style="width: 100%;">
                </a>
            </div>
        </div>
        <div style="clear: both;"></div>      
		<%}%>
  </header>
  <section>
    <!--跑馬燈-->
    <div class="banner">
      <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel" style="width: 100%; height: 100%;">
        <ol class="carousel-indicators">
          <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
          <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
          <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
        </ol>
        <div class="carousel-inner">
          <div class="carousel-item active">
            <img src="../assets/images/AD/001.jpg" class="d-block w-100" style="width: 100%; display: block; height: 400px; ">
          </div>
          <div class="carousel-item">
            <img src="../assets/images/AD/002.jpg" class="d-block w-100" style="width: 100%; display: block; height: 400px;">
          </div>
          <div class="carousel-item">
            <img src="../assets/images/AD/003.jpg" class="d-block w-100" style="width: 100%; display: block; height: 400px;">
          </div>
        </div>
        <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
          <span class="carousel-control-prev-icon" aria-hidden="true"></span>
          <span class="sr-only">Previous</span>
        </a>
        <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
          <span class="carousel-control-next-icon" aria-hidden="true"></span>
          <span class="sr-only">Next</span>
        </a>
      </div>
    </div>
    <!--BAR-->
    <div class="select_bar">
            <ul class="select_bar_ul">
                <a href="products.jsp">
                    <li class="select_bar_item">全部</li>
                </a>
              <a href="productsclass.jsp?classname=果實酒">
                    <li class="select_bar_item">果實酒</li>
                </a>
                <a href="productsclass.jsp?classname=紅酒">
                    <li class="select_bar_item">紅酒</li>
                </a>
                <a href="productsclass.jsp?classname=氣泡酒">
                    <li class="select_bar_item">氣泡酒</li>
                </a>
                <a href="hotproducts.jsp">
                    <li class="select_bar_item">熱門商品</li>
                </a>
                <a href="myloveproducts.jsp">
                    <li class="select_bar_item">我的最愛</li>
                </a>
      </ul>
      <div class="select_bar_search_area">
        <form action="search.jsp">
          <input type="text" class="select_bar_search_inputt" name="search_item" value="請輸入產品全名">
          <input type="submit" class="select_bar_search_icon">
        </form>
      </div>
      <div class="cleaner"></div>
    </div>
    <!--展示區-->
       <!--展示區-->
        <div class="back_block">
            <div class="block_countainer">
                <!--1個產品元件Start-->
				
					<!--1個產品元件Start-->
				
					<%  ResultSet rss;
						sql = "select * from product";
						rss=con.createStatement().executeQuery(sql);
						
						 while(rss.next())
						{
									String GoodsName=rss.getString(1);
									String Email=(String)session.getAttribute("email");
									sql = "select * FROM love_product WHERE (`GoodsName`='"+GoodsName+"') AND(Email='"+Email+"')";
									ResultSet love=con.createStatement().executeQuery(sql);
									if(love.next())
									{
										if(GoodsName.equals(love.getString(2))&& Email.equals(love.getString(1)))
										{%>
											<div class="block_product">
											<div class="block_inner">
											<div class="block_img">
												<a href="item.jsp?itemid=<%=rss.getString(11)%>">
													<img width="100%" src="../assets/images/product_img/<%=rss.getString(10)%>">
												</a>
											</div>
											<div class="block_loaction">
											<div class="block_item">
												<a href="item.jsp?itemid=<%=rss.getString(11)%>">
													<p class="block_name" style="font-size:20px "><%=rss.getString(1)%></p>
												</a> 
												<br>
												<!----加入最愛--->
												<span class="block_love_icon">
											
												<form action="love_pro.jsp">
												<input type="hidden" name="productnam" value="<%=rss.getString(1)%>" >
												<input type="submit" class="block_love_R" name="love_proooo"  >
												</form>
												</span>
								<div class="cleaner"></div>
								</div>
							</div>
							<div class="cleaner"></div>
						</div>
					</div>
									<%}}}%>				
					
				 <!--1個產品元件END-->
				  <div class="cleaner"></div>
            </div>
        </div>


  </section>
  <footer>
    <div>
      <p class="footer_slogen">
        飲酒過量有礙健康，未成年請勿飲酒，禁止酒駕
      </p>
    </div>
    <div class="footer_block">
      <div class="footer25per">
        <div class="footer_block_s">
          <p class="footer_minititle">
            訪客人數
          </p>
          <hr class="footer_titleline">
          <p class="footer_info">
             <%out.print(count);%>
          </p>
        </div>
        <div class="footer_block_s">
          <p class="footer_minititle">
            酒種分類
          </p>
          <hr class="footer_titleline">
          <a href="products.jsp" class="footer_info">
                        全部
                    </a>
                    <a href="productsclass.jsp?classname=果實酒" class="footer_info">
                        果實酒
                    </a>
                    <a href="productsclass.jsp?classname=紅酒" class="footer_info">
                        紅酒
                    </a>
                    <a href="productsclass.jsp?classname=氣泡酒" class="footer_info">
                        氣泡酒
                    </a>
        </div>
      </div>
      <div class="footer25per">
        <div class="footer_block_s">
          <p class="footer_minititle">
            會員功能
          </p>
          <hr class="footer_titleline">
          <a href="#網址" class="footer_info">
            修改資料
          </a>
        </div>
        <div class="footer_block_s">
          <p class="footer_minititle">
            聯絡資訊
          </p>
          <hr class="footer_titleline">
          <p class="footer_info">
            ☏ : (03)9321321
          </p>
          <p class="footer_info">
            No. 200, Zhongshan Rd.,
          </p>
          <p class="footer_info">
            Zhongli Dist.,
          </p>
          <p class="footer_info">
            Taoyuan City 320,
          </p>
          <p class="footer_info">
            Taiwan (R.O.C.)
          </p>
        </div>
      </div>
      <div class="footer50per">
        <div class="footer_ad_area">
          <p class="footer_ad_up">
            NO DRINK
          </p>
          <p class="footer_ad_down">
            NO DRUNK
          </p>
        </div>
      </div>

      <div style="clear: both;"></div>
    </div>
  </footer>

  <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js" integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut" crossorigin="anonymous"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js" integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k" crossorigin="anonymous"></script>
</body>

</html>