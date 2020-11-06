class AddWeightToCartitems < ActiveRecord::Migration[6.0]
  def change
    add_column :cartitems, :weight, :float
  end
end
