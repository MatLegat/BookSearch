//= require jquery
//= require list

$(document).ready(() => {
  const options = {
    valueNames: [ 'title', 'author', 'description' ],
    item: '<li><h4 class="title"></h4><h5 class="author"></h5><p class="description"></p></li>'
  }

  $.getJSON('/books', (books) => {
    console.log(books)
    new List('books', options, books);
  })


})
