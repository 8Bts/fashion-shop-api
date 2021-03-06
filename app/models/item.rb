class Item < ApplicationRecord
  has_and_belongs_to_many :users
  has_and_belongs_to_many :categories

  validates :title, presence: true, uniqueness: true, length: { in: 2..64 }
  validates :price, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :image, presence: true, uniqueness: true, format: { with: URI::DEFAULT_PARSER.make_regexp }
  validates :img_public_id, presence: true

  def as_json(_options = {})
    super(include: { categories: {
      except: %i[created_at updated_at]
    } })
  end
end
