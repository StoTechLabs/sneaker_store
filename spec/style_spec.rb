require 'rspec'
require 'style'
require 'shoe'

describe Style do

  it "should initialize a style with name" do
    test_style = Style.new({:name => 'Air Tech Challenge', :color => 'Obsidian'})
    expect(test_style).to be_an_instance_of Style
  end

  it 'Should add a shoe to the style' do
    test_style = Style.new({:name => 'Air Tech Challenge', :color => 'Obsidian'})
    test_shoe = Shoe.new({:size => 11, :quantity => 3})
    test_style.add_shoe(test_shoe)
    expect(test_style.shoe).to eq [test_shoe]
  end
end
