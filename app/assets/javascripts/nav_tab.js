 $('.nav_link_1').click(function(event){
  $('.tab_1').addClass('active');
  $('.tab_2').removeClass('active');
  $('.tab_3').removeClass('active');
  $('.tab_4').removeClass('active'); 
  $('.tab_5').removeClass('active'); 
});

 $('.nav_link_2').click(function(event){
  $('.tab_1').removeClass('active');
  $('.tab_2').addClass('active');
  $('.tab_3').removeClass('active');
  $('.tab_4').removeClass('active');
  $('.tab_5').removeClass('active');  
});

 $('.nav_link_3').click(function(event){
  $('.tab_1').removeClass('active');
  $('.tab_2').removeClass('active');
  $('.tab_3').addClass('active');
  $('.tab_4').removeClass('active'); 
  $('.tab_5').removeClass('active'); 
});

 $('.nav_link_4').click(function(event){
  $('.tab_1').removeClass('active');
  $('.tab_2').removeClass('active');
  $('.tab_3').removeClass('active');
  $('.tab_4').addClass('active'); 
  $('.tab_5').removeClass('active'); 
});

 $('.nav_link_5').click(function(event){
  $('.tab_1').removeClass('active');
  $('.tab_2').removeClass('active');
  $('.tab_3').removeClass('active');
  $('.tab_4').removeClass('active'); 
  $('.tab_5').addClass('active'); 
});