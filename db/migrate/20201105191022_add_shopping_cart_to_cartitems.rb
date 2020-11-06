class AddShoppingCartToCartitems < ActiveRecord::Migration[6.0]
  def change
    add_column :cartitems, :shopping_cart_id, :integer
    add_index :cartitems, :shopping_cart_id
  end
end
