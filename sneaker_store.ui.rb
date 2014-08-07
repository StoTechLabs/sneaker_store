require './lib/brand'
require './lib/style'
require './lib/shoe'
require 'pry'

@current_brand = nil
@current_style = nil
@current_shoe = nil

def main_menu
  loop do
    system 'clear'
    puts "***SNEAKER STORE INVENTORY***"
    puts "Type 'a' to add a sneaker brand, or 'l' to list current brands"
    puts "Type 'x' to exit"
    main_choice = gets.chomp
    if main_choice == 'a'
      add_brand
    elsif main_choice == 'l'
      list_brands
    elsif main_choice == 'x'
      puts "Thank you, sneaker inventory has shut down."
      exit
    else
      puts "Not a valid entry, please try again."
    end
  end
end

def add_brand
  puts "Enter the name of the brand"
  input_brand = gets.chomp
  Brand.new({:name => input_brand}).save
  Brand.all.each do |brand|
    @current_brand = brand
  end
  add_style
end

def add_style
  puts "New Brand added!\n\n"
  puts "Now, enter the name of the style for this brand"
  input_style = gets.chomp
  Style.new({:name => input_style}).save
  Style.all.each do |style|
    @current_style = style
  end
  @current_brand.add_style(input_style)
  puts "New style added!"
  sleep(0.5)
  add_shoe
end

def add_shoe
  puts "Now, add a colorway for your sneaker style"
  input_color = gets.chomp
  @current_style.add_shoe(input_color)
  puts "Colorway has been added!"
  sleep(0.5)
  puts "Now, add a size."
  input_size = gets.chomp
  @current_style.add_shoe(input_size)
  puts "Shoe size has been added!"
  sleep(0.5)
  puts "Ok, what's the total quantity for that size?"
  input_quantity = gets.chomp
  @current_style.add_shoe(input_quantity)
  puts "Great! Quantity has been added."
  Shoe.new({:color => input_color, :size => input_size, :quantity => input_quantity}).save
  Shoe.all.each do |shoe|
    @current_shoe = shoe
  end
end


main_menu
