require 'rails_helper'

RSpec.describe LanguagesController, type: :request do
  let(:user) { create :user }
  let(:cv) { user.cv }
  let(:language) { create :language, cv: cv }
  let(:invalid_params) { { language: nil } }

  before { sign_in user }

  describe 'GET #new' do
    it 'returns a success response' do
      get new_cv_language_path, xhr: true
      expect(response).to be_successful
    end
  end

  describe 'GET #edit' do
    it 'returns a success response' do
      get edit_cv_language_path(language), xhr: true
      expect(response).to be_successful
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      subject(:create_language) { post cv_languages_path, params: language_params }

      let(:language_params) { { language: attributes_for(:language) } }

      it 'creates a new language entry' do
        expect { create_language }.to change(Language, :count).by(1)
      end

      it 'redirects to the CV display' do
        create_language
        expect(response).to redirect_to(cv_url)
      end
    end

    context 'with invalid params' do
      subject(:create_invalid_language) { post cv_languages_path, params: invalid_language_params, xhr: true }

      let(:invalid_language_params) { { language: invalid_params } }

      it 'does not create a new language entry' do
        expect { create_invalid_language }.not_to change(Language, :count)
      end

      it 'renders the errors remotely' do
        create_invalid_language
        expect(response).to be_successful
      end
    end
  end

  describe 'PUT #update' do
    context 'with valid params' do
      subject(:update_language) { put cv_language_path language, params: language_params }

      let(:language_params) { { language: new_attribute } }
      let(:new_attribute) { { level: new_level } }
      let(:new_level) { 'c1' }

      it 'updates the requested language entry' do
        expect { update_language }.to change { language.reload.level }.to(new_level)
      end

      it 'redirects to the CV display' do
        update_language
        expect(response).to redirect_to(cv_url)
      end
    end

    context 'with invalid params' do
      subject(:update_invalid_language) do
        put cv_language_path(language), params: invalid_language_params, xhr: true
      end

      let(:invalid_language_params) { { language: new_invalid_attribute } }
      let(:new_invalid_attribute) { { language: nil } }

      it 'does not update the requested language entry' do
        expect { update_invalid_language }.not_to(change { language.reload.language })
      end

      it 'renders the errors remotely inside the edit page' do
        update_invalid_language
        expect(response).to be_successful
      end
    end
  end

  describe 'DELETE #destroy' do
    let!(:path) { cv_language_path language }

    it 'destroys the requested language entry' do
      expect { delete path }.to change(Language, :count).by(-1)
    end

    it 'redirects to the CV display' do
      delete path
      expect(response).to redirect_to(cv_url)
    end
  end
end
