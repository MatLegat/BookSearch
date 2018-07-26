//= require jquery
//= require list

$(document).ready(() => {
  const options = {
    valueNames: [ 'title', 'author', 'description' ]
  }
  const ul = $('ul.list').eq(0)

  $.getJSON('/books', (books) => {
    books.forEach((book) => {
      ul.append(`
        <li class="list-item list-group-item">
          <h4 class="title">${book.title}</h4>
          <h5 class="author">${book.author}</h5>
          <div class="content">
            <img class="image" src="${book.img}"></img>
            <p class="description">${book.description}</p>
            ${
              window._signed_in ?
                '<a href="/books/'+book.id+'/edit" class="btn btn-secondary">Edit</a>'
                : ''
            }
          </div>
        </li>
      `)
    })
    const list = new List('books', options)
    list.on('updated', () => {
      if (ul.is(':empty')) {
        ul.append(`
          <li class="list-item list-group-item" id="empty-info">
            <h5>Nothing found!</h5>
          </li>
        `)
      } else {
        $('#empty-info').remove()
      }
    })
  })


})
