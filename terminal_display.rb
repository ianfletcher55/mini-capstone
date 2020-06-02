require "http"
require "tty-table"

system "clear"

puts "Welcome to my music store page!"

response = HTTP.get("http://localhost:3000/api/products")
products = response.parse

products_table = TTY::Table.new ['name', 'price', 'image', 'description'], [['a1', 'a2', 'a3', 'a4'], ['b1', 'b2', 'b3', 'b4'], ['c1', 'c2', 'c3', 'c4']]

products_table.render(:ascii)

puts products_table

puts "If you'd like to update an update, type update. Otherwise, press enter:"
input = gets.chomp

if input == "update"
  puts "Please enter the id of the item you would like to update:"
  input_id = gets.chomp
  puts "Enter the key/value pair you would like to update:"
  input_price = gets.chomp
  params = {:price => input_price}
  response = HTTP.patch("http://localhost:3000/api/products/#{input_id}", params: params)
elsif
  puts "Thank you."
end



puts "If you'd like to delete a product, type delete. Otherwise, press enter:"
input = gets.chomp

if input == "delete"
  puts "Please enter the id of the item you would like to delete:"
  input_id = gets.chomp
  response = HTTP.delete("http://localhost:3000/api/products/#{input_id}")
  puts "Item deleted."
elsif
  puts "Thank you."
end

