require 'unirest'
#require 'tty-prompt'
require 'pp'

#response = Unirest.get("localhost:3000/all_products")

#products = response.body

#prompt = TTY::Prompt.new

#user_input = prompt.select("Which product would you like?", ["Bloom","What's the Story MorningGlory?"])
#p user_input

#products.each do |product|
 # p "here is a product's name"
  #p product['name']
#end

#base_url = "http://localhost:3000/v2"
#system "clear"

p "[1] see all of my products"
p "[2] see a particular product"
p "[3] create a new product"
p "[4] modify a product"
p "[5] which product would you like to delete"

user_input = gets.chomp.to_i

if user_input == 1
  response = Unirest.get("localhost:3000/products")
  pp response.body
elsif user_input == 2
  p "enter the id for the product you would like to look at"
  product_id = gets.chomp
  response = Unirest.get("localhost:3000/products/#{product_id}")
  pp response.body
elsif user_input == 3
  p "What is the toy's name?"
  product_name = gets.chomp
  p "Tell me what the price is."
  product_price = gets.chomp.to_i
  response = Unirest.post("localhost:3000/products", parameters: the_params)
  pp response.body
elsif user_input == 4
  p "let's modify a product"
  p "what product id would you like to modify?"
  product_id = gets.chomp
  response = Unirest.get("localhost:3000/products/#{product_id}")
  #response = Unirest.get("#{base_url}/products/#{product_id}")
  the_params = {}
  p "Enter the original name of the product #{product_id['name']}"
  the_params['name'] = gets.chomp
  p "Enter the original price of the product #{product_id['price']}"
  the_params['price'] = gets.chomp
  p "Enter the original description of the product #{product_id['description']}"
  the_params['description'] = gets.chomp
  p "Enter the original image url of the product #{product_id['image']}"
  the_params['image'] = gets.chomp
  response = Unirest.patch("localhost:3000/products/#{product_id}", parameters: the_params)
  pp response.body
elsif user_input == 5
  p "Which product would you like to delete?"
  product_id = gets.chomp
  response = Unirest.destroy("localhost:3000/products/#{product_id}", parameters: the_params)
  pp response.body
end
