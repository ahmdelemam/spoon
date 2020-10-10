# frozen_string_literal: true

class CreateRecipes < ActiveRecord::Migration[6.0]
  def change
    create_table :recipes do |t|
      t.string :contentful_id, null: false, index: { unique: true }
      t.string :title
      t.references :chef, index: true
      t.string :image
      t.text :description
      t.timestamps
    end
  end
end
