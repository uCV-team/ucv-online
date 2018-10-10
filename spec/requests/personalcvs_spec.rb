require 'rails_helper'

RSpec.describe 'Personalcvs', type: :request do
  describe 'GET /personalcvs' do
    it 'works! (now write some real specs)' do
      get personalcvs_path
      expect(response).to have_http_status(:ok)
    end
  end
end
