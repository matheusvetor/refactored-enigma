# frozen_string_literal: true

class BookSerializer < ActiveModel::Serializer
  cache key: 'book'

  attributes :id, :name, :description, :isbn, :published_at, :tag_list

  belongs_to :author
end
