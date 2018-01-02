class Book < ApplicationRecord
  searchkick default_fields: %i(name isbn description)

  belongs_to :author

  has_many :taggings, dependent: :destroy
  has_many :tags, through: :taggings

  validates :author, presence: true
  validates :name, presence: true
  validates :isbn, uniqueness: { allow_nil: true, case_sensitive: false }

  scope :search_import, -> { includes(:author, :tags) }

  after_create :populate_isbn_async

  def tag_list
    tags.pluck(:name).join(', ')
  end

  def tag_list=(tag_list_string)
    list = tag_list_string.split(', ')

    self.tags = list.map do |tag_name|
      Tag.find_or_create_by(name: tag_name)
    end
  end

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
