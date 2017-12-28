require 'rails_helper'

RSpec.describe Author, type: :model do
  let(:author) { create(:author) }

  context 'validations' do
    it { is_expected.to validate_presence_of(:name) }
  end

  context 'associations' do
    it { is_expected.to have_many(:books) }
  end
end
