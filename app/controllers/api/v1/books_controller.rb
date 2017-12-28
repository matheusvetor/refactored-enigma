module Api
  module V1
    class BooksController < ApplicationController
      before_action :set_book, only: %i(show update destroy)
      def index
        @books = Book.all
        render json: @books
      end

      def show
        render json: @book
      end

      def create
        @book = Book.new(book_attributes)

        if @book.save
          render json: @book, status: :created
        else
          render json: @book.errors.full_messages, status: :unprocessable_entity
        end
      end

      def update
        if @book.update(book_attributes)
          render json: @book, status: :no_content
        else
          render json: @book.errors.full_messages, status: :unprocessable_entity
        end
      end

      def destroy
        @book.destroy
        render json: '', status: :no_content
      end

      private

      def set_book
        @book = Book.find(params[:id])
      rescue ActiveRecord::RecordNotFound
        render json: I18n.t('record_not_found'), status: :not_found
      end

      def book_attributes
        params.permit(:id, :name, :description, :author_id, :isbn)
      end
    end
  end
end
