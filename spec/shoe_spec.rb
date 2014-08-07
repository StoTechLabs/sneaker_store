require 'rspec'
require 'shoe'

describe Shoe do

  it 'should initialize a shoe with a color, size, and quantity' do
    test_shoe = Shoe.new({:color => 'Obsidian', :size => 11, :quantity => 3})
    expect(test_shoe).to be_an_instance_of Shoe
  end
end
