$(function(){

  $(".add_land").on("click", function(e){
    e.preventDefault();
    time = new Date().getTime();
    regexp = new RegExp($(this).data('id'), 'g');
    $(this).before($(this).data('fields').replace(regexp, time)); // add data[fields] before add-lands with regexp replaced by time
  });

  $(".remove_land").on("click", function(e){
    e.preventDefault();
  });

  $("#emissions").on("click", function (e) {
    e.preventDefault();
    $("html,body").animate({scrollTop: $(this.hash).offset().top - 50}, 500);
  });

});

// https://stevepolito.design/blog/create-a-nested-form-in-rails-from-scratch/


// factory for every model - rpsec