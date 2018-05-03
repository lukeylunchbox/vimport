class CreateProposals < ActiveRecord::Migration[5.1]
  def change
    create_table :proposals do |t|
      t.string :product_name
      t.text :description
      t.decimal :cost_per_unit
      t.decimal :weight_per_unit
      t.integer :min_order_quantity
      t.integer :full_order_quantity
      t.string :eta
      t.text :img1_data
      t.text :img2_data
      t.text :img3_data
      t.references :user, foreign_key: true
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end
