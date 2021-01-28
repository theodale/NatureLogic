$(function(){

  $(".add_land").on("click", function(e){
    e.preventDefault();
    time = new Date().getTime();
    regexp = new RegExp($(this).data('id'), 'g');
    $(this).before($(this).data('fields').replace(regexp, time)); // add data[fields] before add-lands with regexp replaced by time
  });

});

// document.documentElement.scrollTop - pass this value to controller then load it (could also be window.pageXOffset)





// https://stevepolito.design/blog/create-a-nested-form-in-rails-from-scratch/

