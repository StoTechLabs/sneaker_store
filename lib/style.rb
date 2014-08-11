class Style
    attr_reader(:name, :color, :shoe)
    @@all_styles = []

  def initialize(attributes)
    @name = attributes[:name]
    @color = attributes[:color]
    @shoe = []
  end

  def Style.all
    @@all_styles
  end

  def add_shoe(shoe)
    @shoe << shoe
  end

  def save
   @@all_styles << self
  end
end
