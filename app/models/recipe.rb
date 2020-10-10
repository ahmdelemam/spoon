# frozen_string_literal: true

class Recipe < ApplicationRecord
  acts_as_taggable_on :tags

  validates :title, :image, :description, presence: true
  validates :contentful_id, presence: true, uniqueness: true

  belongs_to :chef
end
