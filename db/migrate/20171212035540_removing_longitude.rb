class RemovingLongitude < ActiveRecord::Migration[5.1]
  def change
    remove_column :products, :longitude, :float
  end
end
