class Counterparty < ApplicationRecord
  belongs_to :groups_counterparty
  validates :name, :groups_counterparty_id, presence: true
  self.per_page = 5
end
