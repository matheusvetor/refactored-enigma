class BookSerializer < ActiveModel::Serializer
  cache key: 'book'

  attributes :id, :name, :description, :isbn, :published_at

  belongs_to :author
end
