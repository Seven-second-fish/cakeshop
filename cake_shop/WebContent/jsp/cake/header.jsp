<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="page-container page-header header-shadow">
<header>
  <a href="./">
    <img class="nav-logo" src="images/cake/logo.jpg" alt="">
  </a>
 
  <nav class="nav-menu">
        <a  href="jsp/cake/index.jsp"  class="nav-a active">
        <span> 首页</span>
        <span> Home</span>
    </a>

        <a  href="CakeList"  class="nav-a " >
        <span> 所有商品</span>
        <span> Products</span>
    </a>

        <a  href="CakeList?catalogId=9"  class="nav-a ">
        <span> 下午茶点</span>
        <span> Tea Time</span>
    </a>

        <a  href="CakeList?catalogId=8"  class="nav-a ">
        <span> 炫酷星球 </span>
        <span> Cool Plant</span>
    </a>

        <a  href="CakeList?catalogId=7"  class="nav-a ">
        <span> 美食大赏 </span>
        <span> Delicious Show</span>
    </a>

    </nav> 
     <img class="nav-cut-line" src="images/cake/cut-line.png" alt="">
 			 <div class="header-controller">
  					<c:choose>
							<c:when test="${empty landing}">
								 <div class="header-controller-login">
								     <a href="jsp/cake/login.jsp">
								     	<img class="icon" src="images/cake/login-icon.jpg" alt="">
								     	<span class="text" id="uname">登录</span>
								     </a>
								 </div>
								 <div class="header-controller-register" id="regBar_350">
								 	<a href="jsp/cake/reg.jsp">
								        <img class="icon" src="images/cake/register-icon.jpg" alt="">
								        <span class="text">注册</span>
								    </a>
								</div>
								<div class="header-controller-position">
    <div id="header_position">
        <img class="icon-position" src="https://www.boncake.com.cn/themes/boncake/widgets/new_topbar_member/images/position-icon.png" alt="" style="display: none;">
        <span class="text" id="cityM">
                        天津市                    </span>
        <img class="icon-down" src="https://www.boncake.com.cn/themes/boncake/widgets/new_topbar_member/images/pull-down.png" alt="">
    </div>
    <ul class="area-list" id="city_ul">
                <li class="area-item" id="2">
            <img id="city_icon" src="https://www.boncake.com.cn/public/images/c9/a6/38/f7c7decdf8f6eb43b43216d14777248b3fdf982c.png?1529869955#w">
            北京市        </li>
                <li class="area-item" id="22">
            <img id="city_icon" src="https://www.boncake.com.cn/public/images/d5/04/7b/048a1b81fc3f11cf100b9c3bcd6342d677de6aae.png?1529870002#w">
            上海市        </li>
                <li class="area-item" id="43">
            <img id="city_icon" src="https://www.boncake.com.cn/public/images/b6/66/5d/dfdfac3bca119f57337f1e8aae4ff45404449eac.png?1529870031#w">
            天津市        </li>
                <li class="area-item" id="1692">
            <img id="city_icon" src="https://www.boncake.com.cn/public/images/8b/ab/76/cd90d2bcdd210d4dfde9593e8718dbc87b9ddde3.png?1620957032#w">
            苏州市        </li>
                <li class="area-item" id="1875">
            <img id="city_icon" src="https://www.boncake.com.cn/public/images/9f/9b/7b/3645b54beb47a476a0dbc3892b49660985515942.png?1529870085#w">
            沈阳市        </li>
                <li class="area-item" id="3134">
            <img id="city_icon" src="https://www.boncake.com.cn/public/images/38/1e/eb/4e4b55d922b8b657a6f6edde376d97544948146e.png?1552892606#w">
            杭州市        </li>
            </ul>
</div>
							</c:when>
							<c:otherwise>
								<div class="btn-group adminName " style="margin-right:80px;margin-bottom:15px;">
									<a href="javascript:void(0)">
										<img class="icon" src="images/cake/login-icon.png" alt="">
									    ${landing.name} <span class="caret"></span>
									</a>
									<ul class="dropdown-menu dropdown-menu-right">
									    <li><a href="OrderServlet?action=list" >我的订单</a></li>
									    <li><a style="border-top:1px #ccc solid" href="UserServlet?action=off" onClick="return confirm('确定要退出登录吗？')">退 出 登 录</a></li>
									</ul>
								</div>
							</c:otherwise>
						</c:choose>

				<div class="header-controller-cart"  >
						<a id="cart" href="jsp/cake/cart.jsp">
							<div class="icon" style="display:inline-block; position: relative;">
					            <img class="icon" src="images/cake/cart-icon.jpg" style="margin-top:-50px;" alt="">
					            <div class="wz-dot" style="position: absolute;border: 5px solid transparent; border-bottom-color: #e60012; top: -7px;
					    			left: 10px;">
					            </div>
					        </div>
							<span>购物车</span>

							<span class="badge num" style="color:#e60012;font-size: 12px;background:#D3B145;">
								<c:choose>
									<c:when test="${!empty shopCart}">
										${shopCart.getTotQuan()}
									</c:when>
									<c:otherwise>
										0
									</c:otherwise>
								</c:choose>
							</span>
						</a>
					</div>
</div>
</header>
</div>