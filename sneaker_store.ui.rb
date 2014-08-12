require './lib/brand'
require './lib/style'
require './lib/shoe'
# require 'pry'

@current_brand = nil
@current_style = nil
@current_shoe = nil

def main_menu
  loop do
    system 'clear'
    puts "***SNEAKER STORE INVENTORY***"
    puts "Type 'a' to add a sneaker brand, or 'l' to list current brands."
    puts "Type 'x' to exit."
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
      sleep(0.5)
    end
  end
end

def add_brand
  puts "Enter the name of the brand."
  input_brand = gets.chomp
  Brand.new({:name => input_brand}).save
  Brand.all.each do |brand|
    @current_brand = brand
  end
  add_style
end

def add_style
  puts "New Brand added!\n\n"
  puts "Now, enter the name of the style for this brand."
  input_style = gets.chomp
  puts "Now, add a colorway for your sneaker style."
  input_color = gets.chomp
  Style.new({:name => input_style, :color => input_color}).save
  Style.all.each do |style|
    @current_style = style
  end
  # @current_brand.add_style(input_style)
  @current_brand.add_style(@current_style)
  puts "New style, and color added!"
  sleep(0.5)
  add_shoe
end

def add_shoe
  puts "Now, add a size."
  input_size = gets.to_i
  puts "Shoe size has been added!"
  sleep(0.5)
  puts "Ok, what's the total quantity for that size?"
  input_quantity = gets.to_i
  puts "Great! Quantity has been added."
  Shoe.new({:size => input_size, :quantity => input_quantity}).save
  Shoe.all.each do |shoe|
    @current_shoe = shoe
  end
  @current_style.add_shoe(@current_shoe)
  puts "New shoe added to this brand."
  sleep(0.5)

  loop do
    puts "Type 'a' to add another size, or 'n' to add a new style."
    puts "Type 'm' to go back to the main menu."
    choice = gets.chomp
    if choice == 'a'
      add_shoe
    elsif choice == 'n'
      add_style
    elsif choice == 'm'
      main_menu
    else
      puts "Not a valid entry, please try again."
    end
  end
end

def list_brands
  puts "Here is your list of brands."
  Brand.all.each do |brand|
    puts brand.name
  end
  puts "Type a brand name to see the list of styles."
  list_brands = gets.chomp
  Brand.all.each do |brand|
    if list_brands == brand.name
      @current_brand = brand
    end
  end
  list_styles
end

def list_styles
  puts "Here is your list of styles."
  @current_brand.styles.each do |style|
    puts style.name + ": " + style.color.to_s
  end
  puts "Type a style name to see the list of sizes and quantities."
  list_styles = gets.chomp
  @current_brand.styles.each do |style|
    if list_styles == style.name
       @current_style = style
    end
  end
  # puts @current_brand 
  puts @current_style.name
  @current_style.shoe.each do |shoe|
    puts "Color: #{@current_style.color}" + "| " + "Size: #{shoe.size}" + "| " + "Quantity: #{shoe.quantity}"
  end
list_shoe
end


def list_shoe
  puts "\n\n"
  puts "Type another style name to see the list of sizes and quantities or press 'm' for main menu"
  choice = gets.chomp
  @current_brand.styles.each do |style|
    if choice == style.name
      @current_style = style
    end
  end
  puts @current_style.name
  @current_style.shoe.each do |shoe|
    puts "Color: #{@current_style.color}" + "| " + "Size: #{shoe.size}" + "| " + "Quantity: #{shoe.quantity}"
  end
  
  

  if choice == 'm'
        main_menu
  end 

  list_shoe
end


main_menu
