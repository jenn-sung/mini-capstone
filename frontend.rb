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
while true
  system "clear"

  p "[1] see all of my products"
  p "[1.1] search for a product"
  p "[1.2] search for a category of a product"
  p "[2] see a particular product"
  p "[3] create a new product"
  p "[4] modify a product"
  p "[5] which product would you like to delete"
  p "[6] see all suppliers"
  p "[7] see a particular supplier"
  p "[8] create a new supplier"
  p "[9] Sign up"
  p "[10] Log in"
  p "[11] Log out"

  user_input = gets.chomp.to_i

  if user_input == 1
    response = Unirest.get("localhost:3000/v2/products")
    pp response.body
  elsif user_input == 1.1
    p "What would you like to search for?"
    search_input = gets.chomp
    response = Unirest.get("localhost:3000/v2/products",parameters:{search_term: search_input})
    pp response.body
  elsif user_input == 1.2
    p "What is the id of the category you would like to look at?"
    user_category_id = gets.chomp
    response = Unirest.get("localhost:3000//products?category_id_input=#{user_category_id}")
  elsif user_input == 2
    p "enter the id for the product you would like to look at"
    product_id = gets.chomp
    response = Unirest.get("localhost:3000/products/#{product_id}")
    pp response.body
  elsif user_input == 3
    the_params = {}
    p "Enter the product's information that you would like to create."
    p "What is the name of the product?"
    the_params['name'] = gets.chomp
    p "What is the price of the product"
    the_params['price'] = gets.chomp.to_i
    p "What is the description of the product?"
    the_params['description'] = gets.chomp
    p "What is the image of the product?"
    the_params['image'] = gets.chomp
    response = Unirest.post("localhost:3000/products", parameters: the_params)
    pp response.body
  elsif user_input == 4
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
    response = Unirest.delete("localhost:3000/product_id/#{product_id}")
    pp response.body
  elsif user_input == 6
    p "See all suppliers"
    supplier_id = gets.chomp
    response = Unirest.get("localhost:3000/suppliers")
    pp response.body
  elsif user_input == 7
    p "Enter the id of the supplier you would like to view."
    supplier_id = gets.chomp
    response = Unirest.get("localhost:3000/suppliers/#{supplier_id}")
    pp response.body
  elsif user_input == 8
    the_params = {}
    p "Enter the supplier's information that you would like to create."
    p "What is the supplier's name?"
    the_params['name'] = gets.chomp
    p "What is the email of the supplier?"
    the_params['email'] = gets.chomp
    p "What is the phone number of the supplier?"
    the_params['phone_number'] = gets.chomp
    response = Unirest.post("localhost:3000/suppliers/#{supplier_id}", parameters: the_params)
    pp response.body
  elsif user_input == 9
    the_params = {}
    p "Sign up and enter your name!"
    the_params['name'] = gets.chomp
    p "Enter your email"
    the_params['email'] = gets.chomp
    p "Enter your password"
    the_params['password'] = gets.chomp
    p "Please confirm your password"
    the_params['password_confirmation'] = gets.chomp
    response = Unirest.post("localhost:3000/v2/users", parameters: the_params)
    pp response.body
  elsif user_input == 10
    p "Enter your email"
    user_email = gets.chomp
    p "Enter your password"
    user_password = gets.chomp
    response = Unirest.post(
      "localhost:3000/v2/user_token", 
      parameters: {
        auth: {
          email: user_email,
          password: user_password
        }

      }
    )
    jwt = response.body["jwt"]
    Unirest.default_header("Authorization", "Bearer #{jwt}")

    pp response.body
  elsif user_input == 11
    jwt = ""
    Unirest.clear_default_headers()
    p "You are logged out"
  elsif user_input == 'exit'
    break
  end
end

