require 'rails_helper'

RSpec.describe User, type: :model do
  context 'Associations' do
    it { should have_and_belong_to_many(:favourites).class_name('Item') }
  end
  context 'Validations' do
    it { should validate_presence_of(:name) }
    it { should validate_length_of(:name).is_at_least(3) }
  end

  context 'Default values' do
    it 'should be 0 for admin_level when nil' do
      expect(described_class.create({ name: 'Tom' }).admin_level).to eql(0)
    end
  end
end
