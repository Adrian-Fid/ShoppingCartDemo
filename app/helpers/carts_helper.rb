module CartsHelper
  def createCarts(header)
    new_carts = []
    header.drop(2).each do |cart_name|
        new_carts.append(ShoppingCart.create(name: cart_name))
    end 
    new_carts
  end
  
  def updateCarts(row, new_carts)
    product_name = row["name"]
    new_carts.each do |cart|
      amt = row[cart.read_attribute(:name)]
      if amt
          begin
              if amt.include? "("
                weight = amt[/\((.*?)\)/].tr('^0-9\.', '')
                cart.addProduct(product_name, amt, weight)
              else
                cart.addProduct(product_name, amt)
              end
          end
      end
    end
  end
end

