class Shoe
  attr_reader(:size, :quantity)
  @@all_shoes = []

 def initialize(attributes)
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
