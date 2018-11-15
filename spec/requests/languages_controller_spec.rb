require 'rails_helper'

RSpec.describe LanguagesController, type: :request do
  let(:user) { create :user }
  let(:cv) { user.cv }
  let(:language) { create :language, cv: cv }

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

  describe 'PUT #update' do
    subject(:update_language) { put cv_language_path language, params: language_params }

    let(:language_params) { { language: new_attribute } }
    let(:new_attribute) { { level: new_level } }
    let(:new_level) { 'C1 - Effective operational proficiency or advanced' }

    it 'updates the requested language entry' do
      expect { update_language }.to change { language.reload.level }.to(new_level)
    end
    it 'redirects to the CV display' do
      update_language
      expect(response).to redirect_to(cv_url)
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
