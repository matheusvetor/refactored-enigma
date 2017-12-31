require 'rails_helper'

RSpec.describe Tag, type: :model do
  let(:tag) { create(:tag) }

  context 'validations' do
    it { is_expected.to validate_presence_of(:name) }
  end

  context 'associations' do
    it { is_expected.to have_many(:taggings) }
    it { is_expected.to have_many(:books).through(:taggings) }
  end
end
