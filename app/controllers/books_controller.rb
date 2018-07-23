class BooksController < ApplicationController

  def new
    @book = Book.new
  end

  def edit
    @book = Book.find(params[:id])
  end

  def index
    books = Book.all
    render json: books
  end

  def show
    book = Book.find(params[:id])
    render json: book
  end

  def create
    book = Book.new(book_params)
    render json: {
      'saved' => book.save,
      'errors' => book.errors
    }.to_json
  end

  def update
    book = Book.find(params[:id])
    render json: {
      'updated' => book.update(book_params),
      'errors' => book.errors
    }.to_json
  end

  def destroy
    book = Book.find(params[:id])
    render json: {
      'deleted' => book.destroy
    }.to_json
  end

  private
    def book_params
      params.require(:book).permit(:title, :author, :description, :img)
    end

end
