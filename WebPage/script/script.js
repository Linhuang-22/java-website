// JavaScript Document
(function() {
	jQuery.focus = function(slid) {
		var sWidth = $(slid).width(); //获取焦点图的宽度（显示面积）
		var len = $(slid).find("ul li").length; //获取焦点图个数
		var index = 0;
		var picTimer;
		
		//以下代码添加数字按钮和按钮后的半透明条，还有上一页、下一页两个按钮
		//var btn = "<div class='btnBg'></div><div class='btn'>";  //带半透明条
		var btn = "<div class='btn'" +"style='margin-left:-"+ (28*len+20)/2 +"px'>";  //不带半透明条
		for(var i=0; i < len; i++) {
			var ii = i+1;
			//btn += "<span>"+ii+"</span>"; //带数字
			btn += "<span>" + "</span>"; //不带数字
		}
		btn += "</div><div class='preNext pre'></div><div class='preNext next'></div>";
		$(slid).append(btn);
		//$(slid).find("div.btnBg").css("opacity",0.5);
	
		//为小按钮添加鼠标滑入事件，以显示相应的内容
		$(slid+" div.btn span").css("opacity",0.8).mouseenter(function() {
			index = $(slid+" .btn span").index(this);
			showPics(index);
		}).eq(0).trigger("mouseenter");
	
		//上一页、下一页按钮透明度处理
		$(slid+" .preNext").css("opacity",0.2).hover(function() {
			$(this).stop(true,false).animate({"opacity":"0.5"},300);
		},function() {
			$(this).stop(true,false).animate({"opacity":"0.2"},300);
		});
	
		//上一页按钮
		$(slid+" .pre").click(function() {
			index -= 1;
			if(index == -1) {index = len - 1;}
			showPics(index);
		});
	
		//下一页按钮
		$(slid+" .next").click(function() {
			index += 1;
			if(index == len) {index = 0;}
			showPics(index);
		});
	
		//本例为左右滚动，即所有li元素都是在同一排向左浮动，所以这里需要计算出外围ul元素的宽度
		//$(slid+" ul").css("width",sWidth * (len));

		//当页面宽度改变时，相应改变数据，实现响应式
		$(window).resize(function(e) {
			sWidth = $(slid).width();
			len = $(slid).find("ul li").length;
		});

		//鼠标滑上焦点图时停止自动播放，滑出时开始自动播放
		$(slid).hover(function() {
			clearInterval(picTimer);
		},function() {
			picTimer = setInterval(function() {
				showPics(index);
				index++;
				if(index == len) {index = 0;}
			},3000); //此4000代表自动播放的间隔，单位：毫秒
		}).trigger("mouseleave");
		
		//显示图片函数，根据接收的index值显示相应的内容
		function showPics(index) { //普通切换
			var nowLeft = -index*sWidth; //根据index值计算ul元素的left值
			$(slid+" ul").stop(true,false).animate({"left":nowLeft},500); //通过animate()调整ul元素滚动到计算出的position
			$(slid+" .btn span").removeClass("on").eq(index).addClass("on"); //为当前的按钮切换到选中的效果
			$(slid+" .btn span").stop(true,false).animate({"opacity":"0.8"},300).eq(index).stop(true,false).animate({"opacity":"1"},300); //为当前的按钮切换到选中的效果
		}
	};
})(jQuery);

(function() {
	jQuery.notice = function(notice) {
		var status_timer;  //设置计时器
		$(notice).hover(function(){
			window.clearTimeout(status_timer);
		},function () {
			status_timer=window.setTimeout(status_scroll,5000);
		});
		status_timer=window.setTimeout(status_scroll,1000);
		
		function status_scroll(){
			$(notice).children("ul").animate({top:"-40px"},1000,function(){
				$(notice).find("li:first").appendTo(notice + " ul");
				$(notice).children("ul").css("top","0");
			});
			status_timer=window.setTimeout(status_scroll,5000);//轮换速度
		}
	}
})(jQuery);

(function() {
	jQuery.regInput = function(regInput) {
		var $in = $(regInput).children("input,textarea");
		$in.focus(function() {
			$(this).siblings("span").hide();
		})
		$in.focusout(function() {
			if (!$(this).val()) {
				$(this).siblings("span").show();
			}
		})
		$in.each(function() {
			if ($(this).val()) {
				$(this).siblings("span").hide();
			}
		})
	}
})(jQuery);

(function() {
	jQuery.changeInfo = function(btn) {
		var $btn = $(btn);
		$btn.on("click", function() {
			$(this).prev().removeAttr("disabled").parents(".info").siblings("input").show();
		})
	}
})(jQuery);

$(document).ready(function() {
	var $hotsale = $("#hotsale");
	if (!!$hotsale.html()) {
		var top = $hotsale.offset().top;
		$(window).scroll(function() {
			if ($(window).scrollTop() > top) {
				$hotsale.addClass("fixed");
			} else if ( ($(window).scrollTop() < top) && ($hotsale.css("position") == "fixed") ) {
				$hotsale.removeClass("fixed");
			}
		});
	}
	var $tag = $(".reg");
	if (!!$tag.html()) {
		$tag.find("li a").on("click", function() {
			$(this).addClass("active").parent().siblings().children("a").removeClass("active");
			$($tag.find(".reg-con").get($(this).parent().index())).css("display", "block").siblings(".reg-con").hide();
			return false;
		})
	}
});
