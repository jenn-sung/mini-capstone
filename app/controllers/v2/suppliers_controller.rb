class V2::SuppliersController < ApplicationController
  
  def index
    search_term = params[:search_term]
    suppliers = Supplier.order(:id)
    render json: supplier.as_json
  end

  def show
    the_id = params[:id]
    product = Supplier.find_by(id: the_id)
    render json: supplier.as_json
  end

  end

  def create
    supplier = Supplier.new(
      name:  params['name'],
      email: params['email'],
      phone_number: params['phone_number']
      )
    if supplier.save
      render json: supplier.as_json
    else
      render json: {errors: supplier.errors.full_messages}
    end

    def update
      the_id = params[:id]
      supplier = Supplier.find_by(id: the_id)
      supplier.name = params['name']
      supplier.email = params['email']
      supplier.phone_number = params['phone_number']
      if supplier.save
        render json: supplier.as_json
      else
        render json: {errors: supplier.errors.full_messages}
      end
    end

    def destroy
      the_id = params['id']
      product = Supplier.find_by(id: the_id)
      product.destroy
      render json: "You have deleted a product."
    end

  end
end
