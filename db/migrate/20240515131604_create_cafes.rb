class CreateCafes < ActiveRecord::Migration[6.1]
  def change
    create_table :cafes do |t|
      t.string :name, unique: true
      t.string :address, unique: true
      t.string :city
      t.boolean :has_power_outlet, default: false
      t.boolean :chat_meeting_ok, default: false
      t.boolean :has_wifi, default: false
      t.timestamps
    end
  end
end
