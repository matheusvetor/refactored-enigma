class BookSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :isbn, :published_at

  belongs_to :author
end
