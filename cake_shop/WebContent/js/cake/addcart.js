function addToCart(cakeId, callback){
	$.ajax({
		url:"CartServlet?action=add",
		dataType:"json",
		async:true,
		data:{"cakeId":cakeId},
		type:"POST",
		success:function(data){
			$("#cart .num").html(data);
			if(typeof callback === "function"){
				callback(data);
			}
		}
	});
}

/** 加购成功后跳转购物车（立即购买） */
function buyNow(cakeId){
	addToCart(cakeId, function(){
		location.href = "jsp/cake/cart.jsp";
	});
}
