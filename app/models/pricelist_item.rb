class PricelistItem < ApplicationRecord
  belongs_to :pricelist
  belongs_to :good

  validates :price, :currency, presence: { message: 'Вы обязательно должны заполнить'}
  validates :price,  numericality: { greater_than_or_equal_to: 0, message: 'обязательно число и не меньше нуля' }
  validates :good_id, uniqueness: { scope: :pricelist_id,
                                 message: "should happen once per good" }
end
