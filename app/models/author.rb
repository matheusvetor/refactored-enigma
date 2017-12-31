class Author < ApplicationRecord
  searchkick default_fields: %i(name)

  has_many :books, dependent: :destroy

  validates :name, presence: true

  after_commit :reindex_book

  def reindex_book
    books.reindex
  end
end
