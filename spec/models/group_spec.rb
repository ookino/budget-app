require 'rails_helper'

RSpec.describe Group, type: :model do
  let(:user) { User.create(name: 'Yaseer Okino', email: 'y@mail.com', password: '12345678') }
  let(:group) { user.groups.create(name: 'Party', icon: 'PT', color: 'red') }

  describe 'Validations' do
    context 'when valid' do
      it { expect(group).to be_valid }
    end

    it 'should allow valid name' do
      group.name = 'Outing'
      expect(group).to be_valid
    end

    it 'should have a name' do
      group.name
      expect(group.name).to eq('Party')
    end

    it 'should have an icon' do
      group.icon
      expect(group.icon).to eq('PT')
    end

    it 'should have a color' do
      group.color
      expect(group.color).to eq('red')
    end
  end
end
