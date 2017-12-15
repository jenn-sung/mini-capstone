class V2::SuppliersController < ApplicationController
  
  def index
    suppliers = Supplier.order(:id)
    render json: suppliers.as_json
  end

  def show
    the_id = params[:id]
    supplier = Supplier.find_by(id: the_id)
    render json: supplier.as_json
  end

  def create
    supplier = Supplier.new(
      name:  params['name'],
      email: params['email'],
      phone_number: params['phone_number']
      )
    if supplier.save
      render json: suppliers.as_json
    else
      render json: {errors: suppliers.errors.full_messages}
    end

    def update
      the_id = params[:id]
      supplier = Supplier.find_by(id: the_id)
      supplier.name = params['name']
      supplier.email = params['email']
      supplier.phone_number = params['phone_number']
      if supplier.save
        render json: suppliers.as_json
      else
        render json: {errors: suppliers.errors.full_messages}
      end
    end

    def destroy
      the_id = params['id']
      supplier = Supplier.find_by(id: the_id)
      supplier.destroy
      render json: {message: "You have deleted a supplier."}
    end
  end
end