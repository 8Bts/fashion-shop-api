class Category < ApplicationRecord
  has_and_belongs_to_many :items

  validates :name, presence: true, uniqueness: true, length: { minimum: 2 }

  def as_json(_options = {})
    super(include: :items, except: %i[created_at updated_at])
  end
end
