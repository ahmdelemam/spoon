# frozen_string_literal: true

class RecipesController < ApplicationController
  def index
    @recipes = Recipe.includes(:chef).page(params[:page] || 1).per(10)
  end

  def show
    @recipe = Recipe.find(params[:id])
  end
end
