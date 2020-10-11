# frozen_string_literal: true

RSpec.describe Contentful::Importer do
  around do |example|
    VCR.use_cassette('contentful items') do
      example.run
    end
  end

  it 'inherits from ApplicationService' do
    expect(described_class.superclass).to eq(ApplicationService)
  end

  it 'respondes to call' do
    expect(described_class).to respond_to(:call)
  end

  describe '#call' do
    subject(:call) { described_class.call }

    it 'imports recipes from contentful' do
      call
      expect(Recipe.count).to eq(4)
    end

    it 'imports correct recipe data' do
      call
      recipe = Recipe.last
      expect(recipe.title).not_to be_nil
      expect(recipe.description).not_to be_nil
      expect(recipe.image).not_to be_nil
      expect(URI.parse(recipe.image)).to be_instance_of URI::Generic
      expect(recipe.chef.name).not_to be_nil
      expect(recipe.tags).not_to be_nil
      expect(recipe.tags.size).to eq(2)
    end
  end
end
