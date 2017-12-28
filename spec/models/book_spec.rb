require 'rails_helper'

RSpec.describe Book, type: :model do
  let(:book) { create(:book) }

  context 'validations' do
    it { is_expected.to validate_presence_of(:author) }
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:isbn) }
    it { is_expected.to validate_uniqueness_of(:isbn) }
  end

  context 'associations' do
    it { is_expected.to belong_to(:author) }
  end
end
