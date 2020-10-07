# frozen_string_literal: true

class Recipe < ApplicationRecord
  validates :title, :photo, :description, presence: true

  belongs_to :chef
end
