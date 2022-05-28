require 'rails_helper'

RSpec.describe 'Entities', type: :request do
  include Devise::Test::IntegrationHelpers

  let(:user) { User.create(name: 'Yaseer Okino', email: 'y@mail.com', password: '12345678') }
  let(:group) { user.groups.create(name: 'Party', icon: 'PT', color: 'red') }
  let(:entity) { user.entities.create(name: 'Party-transaction', amount: 100, date: '2022-05-28 09:45:22 UTC') }
  describe 'GET /index' do
    before do
      sign_in user
      get group_entities_path(group.id)
    end

    it 'should return response status correct (ok)' do
      expect(response).to have_http_status(:ok)
    end

    it 'respons to html' do
      expect(response.content_type).to include 'text/html'
    end
  end

  describe 'GET /new' do
    before do
      sign_in user
      get new_group_entity_url(group.id)
    end
    it 'should return response status correct (ok)' do
      expect(response).to have_http_status(:ok)
    end
    it 'respons to html' do
      expect(response.content_type).to include 'text/html'
    end
    it 'should include correct placeholder' do
      expect(response.body).to include('Name')
    end
  end
end
