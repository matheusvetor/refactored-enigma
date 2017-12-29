require 'rails_helper'

RSpec.describe Book, type: :model do
  let!(:books) { create_list(:book, 10) }
  let(:book)   { books.first }

  context 'validations' do
    it { is_expected.to validate_presence_of(:author) }
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_uniqueness_of(:isbn).allow_nil.case_insensitive }
  end

  context 'associations' do
    it { is_expected.to belong_to(:author) }
  end

  context 'isbn generation' do
    let(:generated_ibns) { Book.pluck(:isbn) }

    it 'generate a unique isbn value' do
      isbn = Book.new.send(:generate_isbn)

      expect(generated_ibns).to_not include(isbn)
    end

    it 'populate a book with a unique isbn' do
    end
  end
end
