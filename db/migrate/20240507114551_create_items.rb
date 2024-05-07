class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.string :title, null: false
      t.text :text
      t.integer :category_id
      t.integer :condition_id
      t.integer :shipping_id
      t.integer :region_id
      t.integer :schedule_date_id
      t.integer :price
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end