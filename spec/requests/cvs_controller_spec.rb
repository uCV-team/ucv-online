require 'rails_helper'

RSpec.describe CvsController, type: :request do
  let(:user) { create :user }
  let(:cv) { create :cv, user: user }
  let(:invalid_attributes) { { about: nil } }

  before { sign_in user }

  describe 'GET #show' do
    it 'returns a success response' do
      get cv_path cv
      expect(response).to be_successful
    end
  end

  describe 'GET #new' do
    it 'returns a success response' do
      get new_cv_path
      expect(response).to be_successful
    end
  end

  describe 'GET #edit' do
    it 'returns a success response' do
      get edit_cv_path cv
      expect(response).to be_successful
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      subject(:create_cv) { post cv_path, params: cv_params }

      let(:cv_params) { { cv: attributes_for(:cv) } }

      it 'creates a new Cv' do
        expect { create_cv }.to change(Cv, :count).by(1)
      end

      it 'redirects to the created cv' do
        create_cv
        expect(response).to redirect_to(Cv.last)
      end
    end

    context 'with invalid params' do
      subject(:create_invalid_cv) { post cv_path, params: { cv: invalid_attributes } }

      it 'does not create a new Cv' do
        expect { create_invalid_cv }.not_to change(Cv, :count)
      end
    end
  end

  describe 'PUT #update' do
    context 'with valid params' do
      subject(:update_cv) { put cv_path cv, params: params }

      let(:params) { { cv: new_attributes } }
      let(:new_attributes) { { about: new_description } }
      let(:new_description) { 'This is a new description' }

      it 'updates the requested cv' do
        expect { update_cv }.to change(cv, :about).to(new_description)
      end

      it 'redirects to the cv' do
        update_cv
        expect(response).to redirect_to(cv)
      end
    end

    context 'with invalid params' do
      it "returns a success response (i.e. to display the 'edit' template)" do
        put cv_path cv, params: { cv: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end
end
