class Book < ApplicationRecord
  belongs_to :author

  validates :author, presence: true
  validates :name, presence: true

  scope :search, lambda { |q|
    joins(:author).where('books.name ilike :q', q: "%#{q}%")
  }

  after_create :populate_isbn_async

  def populate_isbn!
    return true if isbn.present?
    update_attributes(isbn: generate_isbn)
  end

  private

  def populate_isbn_async
    GenerateIsbnWorker.perform_in(5.seconds, id)
  end

  def generate_isbn
    loop do
      isbn = Faker::Code.isbn
      break isbn unless Book.exists?(isbn: isbn)
    end
  end
end
