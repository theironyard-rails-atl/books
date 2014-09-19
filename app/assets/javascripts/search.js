$(function(){
  //hides the book saver well on page load
  $('.book-saver').hide();
  // setup book info hash
  var book_info = {};
  //function for saving the book
  function book_save(title, author, description, image_url, isbn){
    book_info.title = title;
    book_info.author = author;
    book_info.description = description;
    book_info.image_url = image_url;
    book_info.isbn = isbn;
    };
  //get JSON request that is triggered by button and then saves book info
  $('.search-book').click(function(){
    $.getJSON('https://www.googleapis.com/books/v1/volumes?q=isbn:' + $('.isbn').val(),
      function(response){
        console.log(response);
        if (response.totalItems === 0) {
          alert("No results found");
          }
        else {
          var book = response.items[0].volumeInfo;
          var authors_array = [];
          for (i = 0, length = book.authors.length; i < length; i ++){
            authors_array.push(book.authors[i]);
          }
          var authors = authors_array.join(", ");
          var description = book.description;
          var title = book.title;
          var image_url = book.imageLinks.thumbnail;
          var isbn = book.industryIdentifiers[0].identifier;
          $('.pic').attr('src', image_url);
          $('.title').text(title);
          $('.author').text(authors);
          $('.description').text(description);
          $('.book-saver').slideDown('slow');
          book_save(title, authors, description, image_url, isbn);
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
      dataType: 'json'
      })
    $('.book-saver').slideUp('slow');
    $('.isbn').val('');
    });
  });
