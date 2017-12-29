class Book < ApplicationRecord
  belongs_to :author

  validates :author, presence: true
  validates :name, presence: true
  validates :isbn, presence: true, uniqueness: true

  scope :search, lambda { |q|
    joins(:author).where('books.name ilike :q', q: "%#{q}%")
  }
end
