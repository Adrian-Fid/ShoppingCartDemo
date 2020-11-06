class Cartitem < ApplicationRecord
    belongs_to :shopping_cart
    def subTotal
        product = Product.find(self.product_id)
        if product.promo
            price = product.price + product.promo
        else
            price = product.price
        end
        if self.weight != 0
            subtotal = self.weight * price
        else
            subtotal = self.amount * price
        end
        subtotal.round(2)
    end
end
