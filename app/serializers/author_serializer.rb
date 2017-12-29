class AuthorSerializer < ActiveModel::Serializer
  cache key: 'author'
  attributes :id, :name
end
