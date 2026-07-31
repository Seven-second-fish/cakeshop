$(function(){
	$(".adminName").mouseover(function(){
		$(".dropdown-menu").css("display","inline-block");
	})
	$(".adminName").mouseout(function(){
		$(".dropdown-menu").css("display","none");
	})

	// 顶栏：按当前 URL 高亮对应导航（去掉 header 写死的首页 active）
	var $items = $(".nav-menu .nav-a");
	if($items.length){
		$items.removeClass("active");
		var path = (window.location.pathname || "").toLowerCase();
		var qs = window.location.search || "";
		var catalogMatch = qs.match(/[?&]catalogid=(\d+)/i);
		var catalogId = catalogMatch ? catalogMatch[1] : null;
		var $target = $();

		var isHome = /index\.jsp$/i.test(path)
			|| /\/jsp\/cake\/?$/i.test(path)
			|| path === "/"
			|| path === "";
		var isList = /cakelist/i.test(path);

		if(isHome){
			$target = $items.filter(function(){
				return /index\.jsp/i.test($(this).attr("href") || "");
			}).first();
		}else if(isList){
			if(catalogId){
				$target = $items.filter(function(){
					var h = $(this).attr("href") || "";
					return new RegExp("[?&]catalogId=" + catalogId + "(?:&|$)", "i").test(h);
				}).first();
			}else{
				// CakeList / CakeList2 无分类 → 「所有商品」
				$target = $items.filter(function(){
					var h = $(this).attr("href") || "";
					return /CakeList/i.test(h) && !/catalogId=/i.test(h);
				}).first();
			}
		}

		if($target.length){
			$target.addClass("active");
		}
	}

	// 顶栏城市：选中 + 本地记忆（无后端配送接口）
	var CITY_KEY = "cakeshop_city";
	var $cityLabel = $("#cityM");
	var $cityList = $("#city_ul");
	if($cityLabel.length && $cityList.length){
		try{
			var saved = window.localStorage.getItem(CITY_KEY);
			if(saved){
				$cityLabel.text(saved);
			}
		}catch(err){}

		$cityList.on("mousedown", ".area-item", function(e){
			e.preventDefault();
			e.stopPropagation();
			var name = $.trim($(this).text());
			if(!name){
				return;
			}
			$cityLabel.text(name);
			try{
				window.localStorage.setItem(CITY_KEY, name);
			}catch(err2){}
			$cityList.addClass("is-selected-hide");
			window.setTimeout(function(){
				$cityList.removeClass("is-selected-hide");
			}, 200);
		});
	}
})
