class CreateTags < ActiveRecord::Migration[6.1]
  def change
    create_table :tags do |t|
      t.boolean :has_power_outlet
      t.boolean :is_conversation_allowed
      t.boolean :is_focus_friendly
      t.boolean :has_wifi
      t.timestamps
    end
  end
end
