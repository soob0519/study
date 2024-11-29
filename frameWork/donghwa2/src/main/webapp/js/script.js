//사이트맵
$(document).ready(function(){
    const pcnav = $(".site_map");
    const pcMenu = $(".pc_btn");
    const pcClose = $(".site_map_close");

    pcMenu.click(function() {
    pcnav.addClass("site_map_active");
     });

    pcClose.click(function() {
     pcnav.removeClass("site_map_active");
     });

    $(window).resize(function(){
        if($(window).width() > 980) {
            $(".site_map").show();
            }else{
                $(".site_map").hide();
            }
        });
});

//모바일메뉴
$(document).ready(function(){
    const mnav = $(".m_menu");
    const btMenu = $(".m_btn");
    const mClose = $(".m_menu_close");

    btMenu.click(function() {
    mnav.addClass("m_menu_active");
 });

  mClose.click(function() {
 mnav.removeClass("m_menu_active");
 });

    mnav.mouseleave(function() {
    mnav.removeClass("m_menu_active");
    });

    $(window).resize(function(){
   if($(window).width() < 980) {
     $(".m_menu").show();
    }else{
        $(".m_menu").hide();
    }
  });

});

//메인&서브 gnb
$(function(){
    $(".navi").mouseenter(function(){
        $(".gnb").stop().slideDown();
    }).mouseleave(function() {
        $(".gnb").stop().slideUp();
    });

    $(".gnb").mouseenter(function(){
        $(".gnb").stop().slideDown();
    }).mouseleave(function() {
        $(".gnb").stop().slideUp();
    });

    $(".sub_navi").mouseenter(function(){
        /*if($('.sub_gnb').is(':animated')) return; */
        $(".sub_gnb").stop().slideDown();
    }).mouseleave(function() {
        $(".sub_gnb").stop().slideUp();
    });

    $(".sub_gnb").mouseenter(function(){
        $(".sub_gnb").stop().slideDown();
    }).mouseleave(function() {
        $(".sub_gnb").stop().slideUp();
    });

//메인&서브 헤더 스크롤 배경효과
let $header = $('.header');

$(window).scroll(function(){
    if($(this).scrollTop() > 0) {
        $header.addClass('scroll');
    }else{
        $header.removeClass('scroll');
    }
    
    });

let $header02 = $('.sub_header');

$(window).scroll(function(){
    if($(this).scrollTop() > 0) {
        $header02.addClass('sub_scroll');
    }else{
        $header02.removeClass('sub_scroll');
    }
    
    });

//bx슬라이더_메인비쥬얼
let bxslider_mv = $('.bxslider_mv').bxSlider({
    mode: "fade",
    speed: 500,
    auto: true,
    pager: false,
    controls: false,
    minSlides: 1,
    maxSlides: 1,
    onSlideAfter: function(slideElement, oldIndex, newIndex) {
        $(".btn02").text(newIndex + 1);
    }
    });
$(".prevBtn_mv").on("click", function () {
    bxslider_mv.goToPrevSlide();
});

$(".nextBtn_mv").on("click", function () {
    bxslider_mv.goToNextSlide();
});

//bx슬라이더_제품소개
$('.bxslider_pd').bxSlider({
auto: true,
speed: 500,
pager: true,
controls: false,
slideWidth: 1920,
minSlides: 1,
maxSlides: 1,
});

//홍보센터_뉴스
let list = $(".news_item");
    let show_num=4;
    let num = 0;
    let total = $(">li",list).size();
    let li_width=$("li:first",list).width();
    
    let copyObj = $(">li:lt("+show_num+")",list).clone();
    list.append(copyObj);
    
    $(".nextBtn_news").on("click",function(){
        if(num==total){
            num=0;
            list.css("margin-left",num);
        }
        num++;
        list.stop().animate({marginLeft:-li_width*num+"px"},500);
    });
    
        $(".prevBtn_news").on("click",function(){
        if(num==0){
            num=total;
            list.css("margin-left",-num*li_width+"px");
        }
        num--;
        list.stop().animate({marginLeft:-li_width*num+"px"},500);
    });

$(".prevBtn_news").on("click", function () {
bxslider_news.goToPrevSlide();
});

$(".nextBtn_news").on("click", function () {
bxslider_news.goToNextSlide();
});






    
});
