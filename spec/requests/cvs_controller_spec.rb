require 'rails_helper'

RSpec.describe CvsController, type: :request do
  let(:user) { create :user }
  let(:cv) { user.cv }
  let(:invalid_attributes) do
    { about: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum vel ante
porta, lobortis risus sit amet, suscipit ex.' }
  end

  before { sign_in user }

  describe 'GET #show' do
    it 'returns a success response' do
      get cv_path
      expect(response).to be_successful
    end
  end

  describe 'GET #edit' do
    it 'returns a success response' do
      get edit_cv_path
      expect(response).to be_successful
    end
  end

  describe 'PUT #update' do
    context 'with valid params' do
      subject(:update_cv) { put cv_path, params: params }

      let(:params) { { cv: new_attributes } }
      let(:new_attributes) { { about: new_about } }
      let(:new_about) { 'This is a new description' }

      it 'updates the requested cv' do
        expect { update_cv }.to change { cv.reload.about }.to(new_about)
      end

      it 'redirects to the cv' do
        update_cv
        expect(response).to redirect_to(cv)
      end
    end

    context 'with invalid params' do
      subject(:update_cv) { put cv_path, params: invalid_params }

      let(:invalid_params) { { cv: invalid_attributes } }

      it 'renders the edit page' do
        update_cv
        expect(response).to be_successful
      end
    end
  end
end
