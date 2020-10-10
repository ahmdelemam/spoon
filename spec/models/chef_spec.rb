# frozen_string_literal: true

RSpec.describe Chef, type: :model do
  describe 'associations' do
    it { should have_many(:recipes) }
  end

  describe 'presence validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:contentful_id) }
  end

  describe 'uniqueness validations' do
    subject { FactoryBot.create(:chef) }
    it { should validate_uniqueness_of(:contentful_id) }
  end
end
