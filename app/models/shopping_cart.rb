class ShoppingCart < ApplicationRecord
  has_many :cartitems
  def addProduct(name, amount, weight = 0)
    product = Product.find_by(name: name) #Need to add case where product is not found
    if product
      cartitem = Cartitem.find_by(product_id: product.id, shopping_cart_id: self.id) 
      create_or_add(cartitem, product, amount, weight)
    end
  end

  def totalPrice
      total = 0
      for item in self.cartitems
          total += item.subTotal
      end
      total.round(2)
  end

  private

  def create_or_add(cartitem, product, amount, weight = 0)
    if cartitem
      cartitem.update(amount: cartitem[:amount] + amount, weight: cartitem[:weight] + weight)
    else
      cartitem = Cartitem.create(product_id: product.id, shopping_cart_id: self.id, amount: amount, weight: weight)
    end
  end
end