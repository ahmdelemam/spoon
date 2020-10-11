# frozen_string_literal: true

RSpec.describe Recipe, type: :model do
  describe 'associations' do
    it { should belong_to(:chef).optional }
    it { should have_many(:tags) }
  end

  describe 'presence validations' do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:image) }
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:contentful_id) }
  end

  describe 'uniqueness validations' do
    subject { FactoryBot.create(:recipe) }
    it { should validate_uniqueness_of(:contentful_id) }
  end
end
