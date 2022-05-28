require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "GET /spalsh" do
    it "returns http success" do
      get "/users/spalsh"
      expect(response).to have_http_status(:success)
    end
  end

end
