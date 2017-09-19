class Pricelist < ApplicationRecord
  has_many :pricelist_items
  belongs_to :city
end
