require 'csv'
class Product < ApplicationRecord
    has_many :cartitems
end
