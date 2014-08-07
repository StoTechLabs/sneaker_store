require 'rspec'
require 'style'

describe Style do

  it "should initialize a style with name" do
    test_style = Style.new({:name => 'Air Tech Challenge'})
    expect(test_style).to be_an_instance_of Style
  end
end
