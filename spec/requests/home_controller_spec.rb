require 'rails_helper'

RSpec.describe HomeController, type: :request do
  describe '#check' do
    before { get '/home/check' }

    it 'checks if the app is ok and connected to a database' do
      expect(response.body).to include('1+2=3')
    end
  end
end
