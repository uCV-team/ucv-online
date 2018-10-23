require 'rails_helper'

RSpec.describe PersonalcvsController, type: :request do
  let(:user) { create :user }
  let(:personalcv) { create :personalcv, user: user }
  let(:invalid_attributes) { { about: nil } }

  before { sign_in user }

  describe 'GET #show' do
    it 'returns a success response' do
      get personalcv_path personalcv
      expect(response).to be_successful
    end
  end

  describe 'GET #new' do
    it 'returns a success response' do
      get new_personalcv_path
      expect(response).to be_successful
    end
  end

  describe 'GET #edit' do
    it 'returns a success response' do
      get edit_personalcv_path personalcv
      expect(response).to be_successful
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      subject(:create_personalcv) { post personalcv_path, params: personalcv_params }

      let(:personalcv_params) { { personalcv: attributes_for(:personalcv) } }

      it 'creates a new Personalcv' do
        expect { create_personalcv }.to change(Personalcv, :count).by(1)
      end

      it 'redirects to the created personalcv' do
        create_personalcv
        expect(response).to redirect_to(Personalcv.last)
      end
    end

    context 'with invalid params' do
      it "returns a success response (i.e. to display the 'new' template)" do
        post personalcv_path, params: { personalcv: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe 'PUT #update' do
    context 'with valid params' do
      subject(:update_personalcv) { put personalcv_path personalcv, params: params }

      let(:params) { { personalcv: new_attributes } }
      let(:new_attributes) { { about: new_description } }
      let(:new_description) { 'This is a new description' }

      it 'updates the requested personalcv' do
        expect { update_personalcv }.to change(personalcv, :about).to(new_description)
      end

      it 'redirects to the personalcv' do
        update_personalcv
        expect(response).to redirect_to(personalcv)
      end
    end

    context 'with invalid params' do
      it "returns a success response (i.e. to display the 'edit' template)" do
        put personalcv_path personalcv, params: { personalcv: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end
end
