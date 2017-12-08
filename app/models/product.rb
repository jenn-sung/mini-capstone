class Product < ApplicationRecord
  def as_json
    {
      name: name, 
      price: price, 
      description: description, 
      image: image
    }
  end


  def self.is_discounted
    products = Products.all
    product.each do |product|
    if product.price < 2
      return true
    else
      return false
    end
  end
end
 



#  Create a model method called `is_discounted` that returns true if an item is under $2 and false otherwise.
# • Create a model method called tax which will return the tax that would be charged for a particular product. (Assume a 9% tax rate.)
# • Create a model method called total which will return the sum of the price + tax.
# • Overwrite the as_json method to return the model methods as part of the JSON output.