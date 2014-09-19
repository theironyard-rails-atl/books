$(function(){
  $('.review_cover').tooltip();
  $('.btn.btn-info').click(function(){
    $(this).next(".modal").modal();
  });
});
