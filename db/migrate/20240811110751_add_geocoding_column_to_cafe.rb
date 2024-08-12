class AddGeocodingColumnToCafe < ActiveRecord::Migration[6.1]
  def change
    add_column :cafes, :latitude, :float, null: false, default: 0
    add_column :cafes, :longitude, :float, null: false, default: 0
  end
end
