class AddingLatitude < ActiveRecord::Migration[5.1]
  def change
    add_column :products, :latitude, :float
  end
end
