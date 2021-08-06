class Item < ApplicationRecord
  has_and_belongs_to_many :users
  has_and_belongs_to_many :categories

  validates :title, presence: true, length: { in: 2..64 }
  validates :price, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :image, presence: true, format: { with: URI.regexp }
end
