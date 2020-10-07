# frozen_string_literal: true

RSpec.describe Recipe, type: :model do
  describe 'associations' do
    it { should belong_to(:chef) }
    it { should have_many(:tags) }
  end

  describe 'validations' do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:photo) }
    it { should validate_presence_of(:description) }
  end
end
