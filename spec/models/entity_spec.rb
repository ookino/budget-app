require 'rails_helper'

RSpec.describe Entity, type: :model do
  let(:user) { User.create(name: 'Yaseer Okino', email: 'y@mail.com', password: '12345678') }
  let(:group) { user.groups.create(name: 'Party', icon: 'PT', color: 'red') }
  let(:entity) do
    user.entities.create(name: 'Party-transaction', amount: 100, date: '2022-05-28 09:45:22 UTC', group_id: group.id)
  end

  describe 'Validations' do
    context 'when valid' do
      it { expect(entity).to be_valid }
    end

    it 'should have a name' do
      entity.name
      expect(entity.name).to eq('Party-transaction')
    end

    it 'should have an amount' do
      entity.amount
      expect(entity.amount).to eq(100)
    end
  end
end
