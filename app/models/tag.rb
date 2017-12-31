class Tag < ApplicationRecord
  searchkick default_fields: %i(name)

  has_many :taggings, dependent: :destroy
  has_many :books, through: :taggings

  validates :name, presence: true, uniqueness: true
end
