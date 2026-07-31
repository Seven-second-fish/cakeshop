<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="page-container page-header header-shadow">
<header>
  <a href="./">
    <img class="nav-logo" src="images/cake/logo.jpg" alt="">
  </a>
 
  <nav class="nav-menu">
        <a  href="jsp/cake/index.jsp"  class="nav-a">
        <span> 首页</span>
        <span> Home</span>
    </a>

        <a  href="CakeList"  class="nav-a">
        <span> 所有商品</span>
        <span> Products</span>
    </a>

        <a  href="CakeList?catalogId=9"  class="nav-a">
        <span> 下午茶点</span>
        <span> Tea Time</span>
    </a>

        <a  href="CakeList?catalogId=8"  class="nav-a">
        <span> 炫酷星球 </span>
        <span> Cool Plant</span>
    </a>

        <a  href="CakeList?catalogId=7"  class="nav-a">
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
        <img class="icon-position" src="images/cake/login-icon.jpg" alt="" style="display: none;">
        <span class="text" id="cityM">
                        天津市                    </span>
        <img class="icon-down" src="images/cake/pull-down.png" alt="">
    </div>
    <ul class="area-list" id="city_ul">
                <li class="area-item" id="2">北京市</li>
                <li class="area-item" id="22">上海市</li>
                <li class="area-item" id="43">天津市</li>
                <li class="area-item" id="1692">苏州市</li>
                <li class="area-item" id="1875">沈阳市</li>
                <li class="area-item" id="3134">杭州市</li>
            </ul>
</div>
							</c:when>
							<c:otherwise>
								<div class="btn-group adminName " style="margin-right:12px;margin-bottom:0;">
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
					            <img class="icon" src="images/cake/cart-icon.jpg" style="margin-top:0;" alt="">
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
