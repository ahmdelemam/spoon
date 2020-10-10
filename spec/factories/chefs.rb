# frozen_string_literal: true

FactoryBot.define do
  factory :chef do
    name { 'Mark Zucchiniberg' }
    contentful_id { SecureRandom.hex(10) }
  end
end
