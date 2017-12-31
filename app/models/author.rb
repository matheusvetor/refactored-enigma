class Author < ApplicationRecord
  searchkick default_fields: [:name]

  has_many :books, dependent: :destroy

  validates :name, presence: true

  after_commit :reindex_book

  def reindex_book
    book.reindex
  end
end
