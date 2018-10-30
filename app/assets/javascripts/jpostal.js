$(document).on('turbolinks:load', function() {
  $('#postal_code').on('change', function() {
    $(this).jpostal({
      postcode : [
        '#postal_code'
      ],
      address : {
        '#prefecture' : '%3',
        '#city_name' : '%4',
        '#street_name' : '%5'
      }
    });
  });
});
