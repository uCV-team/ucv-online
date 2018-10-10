require 'rails_helper'

RSpec.describe Devise::RegistrationsController, type: :request do
  describe '#create' do
    let(:post_request) { post user_registration_path, params: params }
    let(:password) { 'bobbsonPW123' }
    let(:params) do
      {
        user: {
          first_name: 'Bobby Bob',
          last_name: 'Bobbson',
          email: 'bobby.bobbson@bobb.son',
          password: password,
          password_confirmation: password
        }
      }
    end

    it 'registers with all permitted params' do
      expect { post_request }.to change(User, :count).from(0).to(1)
    end
  end
end
