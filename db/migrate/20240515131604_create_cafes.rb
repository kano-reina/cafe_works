class CreateCafes < ActiveRecord::Migration[6.1]
  def change
    create_table :cafes do |t|
      t.string :name
      t.string :address
      t.string :city
      t.timestamps
    end
  end
end
