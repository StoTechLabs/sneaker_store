class Style

  def initialize(attributes)
    @name = attributes[:name]
    @shoe = []
  end

  def shoe
    @shoe
  end

  def add_shoe(shoe)
    @shoe << shoe
  end
end
