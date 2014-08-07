class Brand

  def initialize(attributes)
    @name = attributes[:name]
    @headquarters = attributes[:headquarters]
    @style = []
  end

  def style
    @style
  end

  def add_style(style)
    @style << style
  end

end
