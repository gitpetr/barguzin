class Good < ApplicationRecord
  validates :name, presence: true
  self.per_page = 5
end
