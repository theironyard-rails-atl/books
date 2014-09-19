$(function(){
  $('.tooltp').tooltip();
  $('.btn.btn-info').click(function(){
    $(this).next(".modal").modal();
  });
});
