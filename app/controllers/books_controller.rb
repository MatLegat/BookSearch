class BooksController < ApplicationController

  def new
    authenticate_user! if not user_signed_in?
    @book = Book.new
  end

  def edit
    authenticate_user! if not user_signed_in?
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
    if require_login then
      book = Book.new(book_params)
      render json: {
        'saved' => book.save,
        'errors' => book.errors
      }.to_json
    end
  end

  def update
    if require_login then
      book = Book.find(params[:id])
      render json: {
        'updated' => book.update(book_params),
        'errors' => book.errors
      }.to_json
    end
  end

  def destroy
    if require_login then
      book = Book.find(params[:id])
      render json: {
        'deleted' => book.destroy
      }.to_json
    end
  end

  private
    def book_params
      params.require(:book).permit(:title, :author, :description, :img)
    end

    def require_auth
      return true if user_signed_in?
      render json: {
        'saved' => false,
        'errors' => {'user' => ['not logged in']}
      }.to_json
      return false
    end

end
