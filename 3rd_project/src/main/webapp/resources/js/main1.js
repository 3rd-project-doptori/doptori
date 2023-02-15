$(".que").click(function() {
  $(this).next(".anw").stop().slideToggle(1000);
 $(this).toggleClass('on').siblings().removeClass('on');
 $(this).next(".anw").siblings(".anw").slideUp(1000); // 1개씩 펼치기
});
