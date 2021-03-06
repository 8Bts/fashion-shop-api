require 'rails_helper'

RSpec.describe Category, type: :model do
  context 'Associations' do
    it { should have_and_belong_to_many(:items) }
  end
  context 'Validations' do
    it { should validate_presence_of(:name) }
    it { should validate_length_of(:name).is_at_least(2) }
  end
end
