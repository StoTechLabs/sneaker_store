class Brand

  def initialize(attributes)
    @name = attributes[:name]
    @headquarters = attributes[:headquarters]
    @styles = []
  end

  def styles
    @styles
  end

  def add_style(style)
    @styles << style
  end
end
