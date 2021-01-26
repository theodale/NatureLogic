$(function(){

  $(".add_land").on("click", function(e){
    e.preventDefault();
    time = new Date().getTime();
    regexp = new RegExp($(this).data('id'), 'g');
    $(this).before($(this).data('fields').replace(regexp, time)); // add data[fields] before add-lands with regexp replaced by time
  });

});

// https://stevepolito.design/blog/create-a-nested-form-in-rails-from-scratch/


// factory for every model - rpsec


// <% @land_types.each do |land_type| %>
// <%= f.fields_for :lands do |land_form| %>
//     <%= land_form.hidden_field :sprayed, value: true %>
//     <%= land_form.hidden_field :land_type_id, value: land_type.id %>
//     <%= land_form.number_field :area, value: 0, label: land_type.category + " - Sprayed" %>
// <% end %>
// <%= f.fields_for :lands do |land_form| %>
//     <%= land_form.hidden_field :sprayed, value: false %>
//     <%= land_form.hidden_field :land_type_id, value: land_type.id %>
//     <%= land_form.number_field :area, value: 0, label: land_type.category + " - Not Sprayed" %>
// <% end %>
// <% end %>



//add hedgerows
//add hedgerows as an equal to lands and include into the carbon calculations
//combine lands into one group each, even if multiple

//look at space for nature rating and include hedgrerows into defra rating

//biodiversity survey - could add questions in active admin
