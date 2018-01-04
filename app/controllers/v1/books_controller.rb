# frozen_string_literal: true

class V1::BooksController < ApplicationController
  def index
    books = Book.all
    render json:books, status: :ok
  end

  def create
  	book = Book.new(book_params)

  	if book.save
  		render json:book, status: :created
  	else 
  		render json:{errors: book.errors}, status: :unprocessable_entity
  	end
  end

  def show
  	book = Book.find(params[:id])
  	render json:book, status: :ok
  end

  def update
    book = Book.find(params[:id])

    if book.update(book_params)
      render json: book, status: :ok
    else
      render json: { errors: book.errors }, status: :unprocessable_entity
    end
  end

  def destroy
  	book = Book.find(params[:id])
  	book.destroy
  	head 204
  end

  def book_params
  	params.require(:book).permit(:title,:author,:weight,:publisher,:language,:pages,:publication_date)
  end
end