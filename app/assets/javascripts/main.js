$(function() {
  $('.menu-trigger').on('click',function(){
    if($(this).hasClass('active')){
      $(this).removeClass('active');
      $('.side-bar').removeClass('open');
      $('.overlay').removeClass('open');
    } else {
      $(this).addClass('active');
      $('.side-bar').addClass('open');
      $('.overlay').addClass('open');
    }
  });
  
});