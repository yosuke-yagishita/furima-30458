require 'rails_helper'

RSpec.describe 'BuyerInfos', type: :request do
  describe 'GET /index' do
    it 'returns http success' do
      get '/buyer_infos/index'
      expect(response).to have_http_status(:success)
    end
  end
end
