# frozen_string_literal: true

class Chef < ApplicationRecord
  validates :name, presence: true
  validates :contentful_id, presence: true, uniqueness: true

  has_many :recipes
end
