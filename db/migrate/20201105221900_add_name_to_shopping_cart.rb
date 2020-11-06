class AddNameToShoppingCart < ActiveRecord::Migration[6.0]
  def change
    add_column :shopping_carts, :name, :string
  end
end
