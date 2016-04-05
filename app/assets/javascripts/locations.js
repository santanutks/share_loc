$(function(){
  $(document).on('change', '#location_is_private', function(){
    if($(this).is(':checked')){
      $('.share-with').show();
    } else {
      $('.share-with').hide();
    }
  });
});