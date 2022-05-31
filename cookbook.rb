require_relative 'recipe'
require 'csv'

class Cookbook
  def initialize(csv_file_path)
    @csv_file_path = csv_file_path
    @recipes = []
    load_csv
  end

  def true?(str)
    str.to_s.downcase == "true"
  end

  def load_csv
    CSV.foreach(@csv_file_path) do |row|
      @recipes << Recipe.new({ name: row[0], description: row[1], rating: row[2], prep_time: row[3], marked: true?(row[4]) })
    end
  end

  def save_csv
    CSV.open(@csv_file_path, "wb") do |csv|
      @recipes.each do |recipe|
        csv << [recipe.name, recipe.description, recipe.rating, recipe.prep_time, recipe.marked?]
      end
    end
  end

  def all
    return @recipes
  end

  def add_recipe(recipe)
    @recipes << recipe
    save_csv
  end

  def remove_recipe(recipe_index)
    @recipes.delete_at(recipe_index)
    save_csv
  end
end
