$(function(){
  //hides the book saver well on page load
  $('.book-saver').hide();
  // setup variables used later
  var book_info = {};
  var book_id = 0;
  //function for saving the book
  function book_save(title, author, description, image_url, isbn, categories){
    book_info.title = title;
    book_info.author = author;
    book_info.description = description;
    book_info.image_url = image_url;
    book_info.isbn = isbn;
    book_info.categories = categories;
    };
  //changes book_id
  function update_book_id(id){
    book_id = id;
  };
  //get JSON request that is triggered by button and then saves book info
  $('.search-book').click(function(){
    var isbns = {};
    isbns.isbn = $('.isbn').val();
    $.ajax('/books/query', {
      type: 'POST',
      data: isbns,
      dataType: 'json',
      success: function(response){
       if (response === 'no book') {
        $.getJSON('https://www.googleapis.com/books/v1/volumes?q=isbn:' + $('.isbn').val(),
           function(response){
            //  console.log(response);
             if (response.totalItems === 0) {
               alert("No results found");
               }
             else {
               var book = response.items[0].volumeInfo;
               var authors_array = [];
               var categories_array = [];
               for (i = 0, length = book.categories.length; i < length; i ++){
                 categories_array.push(book.categories[i]);
               }
               for (i = 0, length = book.authors.length; i < length; i ++){
                 authors_array.push(book.authors[i]);
               }
               var authors = authors_array.join(", ");
               var description = book.description;
               var title = book.title;
               var image_url = book.imageLinks.thumbnail;
               var isbn = book.industryIdentifiers[0].identifier;
               var categories = categories_array.join(", ");
               console.log(categories);
               $('.pic').attr('src', image_url);
               $('.title').text(title);
               $('.author').text(authors);
               $('.categories').text(categories);
               $('.description').text(description);
               $('.book-saver').slideDown('slow');
               $('.show-book').hide();
               book_save(title, authors, description, image_url, isbn, categories);
             }
            })
       }
       else{
         update_book_id(response.id);
         $('.pic').attr('src', response.image_url);
         $('.title').text(response.title);
         $('.author').text(response.author);
         $('.categories').text(response.categories);
         $('.description').text(response.description);
         $('.book-saver').slideDown('slow');
         $('.save-book').hide();
         $('.book-saver').prepend("<h4>We already have this book. Click Book Page below to view it's page</h4>");
       }
      }
    })
  });
  //cancel will hide the book saver menu
  $('.cancel').click(function(){
      $('.book-saver').slideUp('slow');
      var book_info = {};
    });
  //saves the book to the DB
  $('.save-book').click(function(){
    var books = {};
    books.book = book_info;
    $.ajax("/books", {
      type: 'POST',
      data: books,
      dataType: 'json',
      success: function(book){
        console.log(book);
        $('.test').prepend( $('<div class="well">' + '<a href=books/' + book.id + '>' + '<h1>' + book.title
        +'</a>'+ '<small> by ' + book.author + '</small>'+ '</h1>' +
        '<img class = "cover" src =' + book.image_url.toString() + '></img>' + '<p>' + book.categories + '</p>' + '<p>' + book.description + '</p>' + "</div>") );
      }
      })
    $('.book-saver').slideUp('slow');
    $('.isbn').val('');
    });
  //take user to the books page
  $('.show-book').click(function(){
    window.location.replace("/books/" + book_id);
  });

});
