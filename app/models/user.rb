class User < ApplicationRecord
  before_save :default_values

  has_and_belongs_to_many :favourites, class_name: 'Item', foreign_key: 'user_id'
  
  validates :name, presence: true, uniqueness: true, length: { minimum: 3 }
  validates :admin_level, allow_nil: true, numericality: { only_integer: true, greater_or_equal_than: 0 }
  
  def as_json(options = {})
    super(include: { favourites: {
      except: [:created_at, :updated_at] 
      }}, except: [:created_at, :updated_at])
  end

  private

  def default_values
    self.admin_level = 0 if self.admin_level.nil?
  end
end
