class AddProductsToCartitems < ActiveRecord::Migration[6.0]
  def change
    add_column :cartitems, :product_id, :integer
    add_index :cartitems, :product_id
  end
end
