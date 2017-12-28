class BookSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :published_at

  belongs_to :author
end
