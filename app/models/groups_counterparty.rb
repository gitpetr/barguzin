class GroupsCounterparty < ApplicationRecord
  has_many :counterparties, dependent: :destroy
  validates :name, presence: true
  self.per_page = 5
end
