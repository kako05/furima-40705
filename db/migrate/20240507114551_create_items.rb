class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.string :title, null: false
      t.text :text, null: false
      t.integer :category_id, null: false
      t.integer :condition_id, null: false
      t.integer :shipping_id, null: false
      t.integer :region_id, null: false
      t.integer :schedule_date_id, null: false
      t.integer :price, null: false
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end