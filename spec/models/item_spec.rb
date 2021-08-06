require 'rails_helper'

RSpec.describe Item, type: :model do
  context 'Associations' do
    it { should have_and_belong_to_many(:users) }
    it { should have_and_belong_to_many(:categories) }
  end
  
  context 'Validations' do
    it { should validate_presence_of(:title) }
    it { should validate_length_of(:title).is_at_least(2).is_at_most(64) }
    
    it { should validate_presence_of(:price) }
    it { should validate_numericality_of(:price).is_greater_than(0) }

    it { should validate_presence_of(:image) }
    it { should allow_value('https://foo.com').for(:image) }
    it { should_not allow_value('foo.bar').for(:image) }
  end
end
