class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.references :user, null: false, foreign_key: true
      t.references :cafe, null: false, foreign_key: true
      t.text :body
      t.integer :rating
      t.timestamps
    end
  end
end
