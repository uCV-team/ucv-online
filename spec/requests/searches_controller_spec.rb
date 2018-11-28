require 'rails_helper'

RSpec.describe SearchesController, type: :request do
  let(:user) { create :user }

  before { sign_in user }

  describe 'GET #index' do
    it 'returns a success response' do
      get search_path
      expect(response).to be_successful
    end
  end
end
