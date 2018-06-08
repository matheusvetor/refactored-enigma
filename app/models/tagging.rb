# frozen_string_literal: true

class Tagging < ApplicationRecord
  belongs_to :book
  belongs_to :tag
end
