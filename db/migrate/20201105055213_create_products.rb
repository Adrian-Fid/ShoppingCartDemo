class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :brand
      t.string :name
      t.string :category
      t.float :price
      t.string :price_condition
      t.float :promo
      t.boolean :tax

      t.timestamps
    end
  end
end
