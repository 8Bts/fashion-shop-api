require 'rails_helper'

RSpec.describe User, type: :model do
  context 'Associations' do
    it { should have_and_belong_to_many(:favourites, class_name: 'Item', join_table: 'items_users') }
  end
  context 'Validations' do
    it { should validate_presence_of(:name) }
    it { should validate_length_of(:name).is_at_least(3) }
  end
end
