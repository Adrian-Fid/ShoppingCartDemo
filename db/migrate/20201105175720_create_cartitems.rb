class CreateCartitems < ActiveRecord::Migration[6.0]
  def change
    create_table :cartitems do |t|
      t.timestamps
      t.integer :amount
    end
  end
end
