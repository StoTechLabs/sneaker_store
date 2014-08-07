require 'rspec'
require 'shoe'

describe Shoe do
  it 'should initialize a shoe with a color and size' do
  test_shoe = Shoe.new({:color => 'Obsidian', :size => 11})
  expect(test_shoe).to be_an_instance_of Shoe
 end
end
