class BooksController < ApplicationController

  before_action :require_login, except: [:index, :show]

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
    @book = Book.new(book_params)
    if @book.save
      redirect_to root_path, notice: 'Book created'
    else
      render 'new'
    end
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to root_path, notice: 'Book updated'
    else
      render 'edit'
    end
  end

  def destroy
    book = Book.find(params[:id])
    if book.destroy
      redirect_to root_path, notice: 'Book deleted.'
    else
      redirect_to root_path, alert: 'Couldn\'t delete book.'
    end
  end

  private
    def book_params
      params.require(:book).permit(:title, :author, :description, :img)
    end

    def require_login
      authenticate_user! unless user_signed_in?
    end

end
