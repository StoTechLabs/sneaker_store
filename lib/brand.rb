class Brand
      attr_reader(:name, :headquarters, :styles)
    @@all_brands = []

  def initialize(attributes)
    @name = attributes[:name]
    @headquarters = attributes[:headquarters]
    @styles = []
  end

  def Brand.all
    @@all_brands
  end

  def add_style(style)
    @styles << style
  end

  def save
   @@all_brands << self
  end
end
