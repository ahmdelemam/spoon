# frozen_string_literal: true

class Chef < ApplicationRecord
  validates :name, presence: true

  has_many :recipes
end
