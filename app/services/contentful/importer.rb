# frozen_string_literal: true

module Contentful
  class Importer < ApplicationService
    def initialize; end

    def call
      client ||= ::Contentful::Client.new(
        space: ENV['CONTENTFUL_SPACE_ID'],
        access_token: ENV['CONTENTFUL_ACCESS_TOKEN'],
        dynamic_entries: :auto # Enables Content Type caching.
      )

      client.entries(content_type: 'recipe').each do |entry|
        import_recipe(entry)
      end
    end

    private

    # rubocop:disable Metrics/AbcSize
    def import_recipe(entry)
      recipe = Recipe.find_or_initialize_by(contentful_id: entry.id)
      recipe.title = entry.title
      recipe.image = entry.photo.url
      recipe.description = entry.description
      recipe.tag_list.add(entry.tags.map(&:name)) if entry.fields.key?(:tags)
      recipe.chef = import_chef(entry)
      recipe.save
    end
    # rubocop:enable Metrics/AbcSize

    def import_chef(entry)
      return nil unless entry.fields.key?(:chef)

      chef = Chef.find_or_initialize_by(contentful_id: entry.chef.id)
      chef.name = entry.chef.name
      chef.save
      chef
    end
  end
end
