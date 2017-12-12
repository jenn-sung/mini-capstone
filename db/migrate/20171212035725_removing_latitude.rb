class RemovingLatitude < ActiveRecord::Migration[5.1]
  def change
    remove_column :products, :latitude, :float
  end
end
