class Product < ApplicationRecord
  # belongs_to :user
  # has_many :carted_products
  # has_many :orders, through: :carted_products
  # has_many :images
  # has_many :categories, through: :category_products
  # has_many :category_products
  # belongs_to :supplier

  validates :price, numericality: { greater_than: 0 }
  validates :price, presence: true
  validates :name, uniqueness: true
  validates :name, presence: true
  

  # def supplier
  #   Supplier.find_by(id: supplier_id)
  # end

  # def images
  #   Image.where(product_id: id)
  # end


  def as_json
    {
      id: id,
      name: name, 
      price: price, 
      description: description, 
      # images: images,
      is_discounted?: is_discounted?,
      tax: tax,
      total: total,
      supplier_id: supplier.as_json,
    }
  end

  def is_discounted?
    price < 2
  end

  def tax
    price * 0.09
  end

  def total
    price + tax
  end

  def less_than_two
    less_than_two = Product.is_discounted
    render json: product.as_json
  end

end


 



#  Create a model method called `is_discounted` that returns true if an item is under $2 and false otherwise.
# • Create a model method called tax which will return the tax that would be charged for a particular product. (Assume a 9% tax rate.)
# • Create a model method called total which will return the sum of the price + tax.
# • Overwrite the as_json method to return the model methods as part of the JSON output.