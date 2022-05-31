class Recipe
  attr_reader :name, :description, :rating, :prep_time

  def initialize(args = {})
    @name = args[:name]
    @description = args[:description]
    @rating = args[:rating]
    @prep_time = args[:prep_time]
    @marked = args[:marked]
  end

  def marked?
    return @marked
  end

  def marked!
    @marked = true
  end
end
