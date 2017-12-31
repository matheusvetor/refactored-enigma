module Api
  module V1
    class AuthorsController < ApplicationController
      before_action :set_author, only: %i(show)

      def index
        @authors = Author.paginate(page: params[:page], per_page: params[:per_page])

        render json: @authors
      end

      def show
        render json: @author
      end

      def create
        @author = Author.new(author_attributes)

        if @author.save
          render json: @author, status: :created
        else
          render json: @author.errors.full_messages, status: :unprocessable_entity
        end
      end

      private

      def set_author
        @author = Author.find(params[:id])
      rescue ActiveRecord::RecordNotFound
        render json: I18n.t('record_not_found'), status: :not_found
      end

      def author_attributes
        params.permit(:name)
      end
    end
  end
end
