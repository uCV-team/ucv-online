require 'rails_helper'

RSpec.describe 'Personalcvs', type: :request do
  describe '#new' do
    it 'returns a page' do
      get new_personalcv_path
      expect(response).to have_http_status(:ok)
    end
  end
end
