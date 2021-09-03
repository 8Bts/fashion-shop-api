class Item < ApplicationRecord
  has_and_belongs_to_many :users
  has_and_belongs_to_many :categories

  validates :title, presence: true, uniqueness: true, length: { in: 2..64 }
  validates :price, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :image, presence: true, uniqueness: true, format: { with: URI.regexp }
  validates :img_delete_token, presence: true

  def as_json(options = {})
    super(include: { categories: {
      except: [:created_at, :updated_at] 
      }})
  end

end
