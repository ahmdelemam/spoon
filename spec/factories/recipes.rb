# frozen_string_literal: true

FactoryBot.define do
  factory :recipe do
    title { 'White Cheddar Grilled Cheese with Cherry Preserves & Basil' }
    description { 'Saag paneer is a popular Indian dish with iron-rich spinach and cubes of.' }
    image { File.open('spec/fixtures/image.png').path }
    chef
    contentful_id { SecureRandom.hex(10) }
  end
end
