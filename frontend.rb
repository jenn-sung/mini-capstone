require 'unirest'
require 'tty-prompt'
require 'pp'

response = Unirest.get("localhost:3000/all_products")

products = response.body

prompt = TTY::Prompt.new

user_input = prompt.select("Which product would you like?", ["Bloom","What's the Story MorningGlory?"])
p user_input

#products.each do |product|
 # p "here is a product's name"
  #p product['name']
#end

base_url = "http://localhost:3000/v2"
system "clear"

p "[1] see all of my products"
p "[2] see a particular product"
p "[3] create a new product"
p "[4] modify a product"
p "[5] which product would you like to delete"

user_input = gets.chomp.to_i

if user_input == 1
  response = Unirest.get("#{base_url}/products")
  pp response.body
elsif user_input == 2
  p "enter the id for the product you would like to look at"
  product_id = gets.chomp
  response = Unirest.get("#{base_url}/products/#{product_id}")
  pp response.body
elsif user_input == 3
  p "What is the toy's name?"
  product_name = gets.chomp
  p "Tell me what the price is."
  product_price = gets.chomp.to_i
  response = Unirest.post("#{base_url}/products", parameters: the_params)
  pp response.body
elsif user_input == 4
  the_params = {}
  p "let's modify a product"
  p "what product would you like to modify?"
  product_id = gets.chomp
  response = Unirest.get("#{base_url}/products/#{product_id}")
  product = response.body
elsif user_input == '5'
  p "Which product would you like to delete?"
  product_id = gets.chomp
  response = Unirest.delete("#{base_url}/products/#{product_id}")
end