class Shoe
  attr_reader(:color, :size, :quantity)
  @@all_shoes = []

 def initialize(attributes)
  @color = attributes[:color]
  @size = attributes[:size]
  @quantity = attributes[:quantity]
 end

 def Shoe.all
  @@all_shoes
 end

 def save
  @@all_shoes << self
 end
end
