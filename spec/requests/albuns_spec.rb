require 'rails_helper'

RSpec.describe "Albuns", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/albuns/index"
      expect(response).to have_http_status(:success)
    end
  end

end
