class Category < ApplicationRecord
  has_and_belongs_to_many :items

  validates :name, presence: true, length: { minimum: 2 }
end
