# frozen_string_literal: true

class Recipe < ApplicationRecord
  acts_as_taggable_on :tags

  validates :title, :photo, :description, presence: true

  belongs_to :chef
end
