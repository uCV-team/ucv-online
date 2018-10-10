require 'rails_helper'

RSpec.describe Devise::RegistrationsController, type: :request do
  describe '#create' do
    let(:user) { create :user }
    let(:post_request) { post user_registration_path, params: user.to_param }

    it 'registers with all permitted params' do
      expect { post_request }.to change(User, :count).from(0).to(1)
    end
  end
end
