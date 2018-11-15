require 'rails_helper'

RSpec.describe 'Experiences', type: :request do
  let(:user) { create :user }
  let(:cv) { user.cv }
  let(:experience) { create :experience, cv: cv }
  let(:invalid_params) { { title: nil } }

  before { sign_in user }

  describe 'GET #new' do
    it 'returns a success response' do
      get new_cv_experience_path, xhr: true
      expect(response).to be_successful
    end
  end

  describe 'GET #edit' do
    it 'returns a success response' do
      get edit_cv_experience_path(experience), xhr: true
      expect(response).to be_successful
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      subject(:create_experience) { post cv_experiences_path, params: experience_params }

      let(:experience_params) { { experience: attributes_for(:experience) } }

      it 'creates a new experience entry' do
        expect { create_experience }.to change(Experience, :count).by(1)
      end

      it 'redirects to the CV display' do
        create_experience
        expect(response).to redirect_to(cv_url)
      end
    end

    context 'with invalid params' do
      subject(:create_invalid_experience) { post cv_experiences_path, params: invalid_experience_params, xhr: true }

      let(:invalid_experience_params) { { experience: invalid_params } }

      it 'does not create a new experience entry' do
        expect { create_invalid_experience }.not_to change(Experience, :count)
      end

      it 'renders the errors remotely' do
        create_invalid_experience
        expect(response).to be_successful
      end
    end
  end

  describe 'PUT #update' do
    context 'with valid params' do
      subject(:update_experience) { put cv_experience_path experience, params: experience_params }

      let(:experience_params) { { experience: new_attribute } }
      let(:new_attribute) { { description: new_description } }
      let(:new_description) { 'Developing web applications' }

      it 'updates the requested experience entry' do
        expect { update_experience }.to change { experience.reload.description }.to(new_description)
      end

      it 'redirects to the CV display' do
        update_experience
        expect(response).to redirect_to(cv_url)
      end
    end

    context 'with invalid params' do
      subject(:update_invalid_experience) do
        put cv_experience_path(experience), params: invalid_experience_params, xhr: true
      end

      let(:invalid_experience_params) { { experience: new_invalid_attribute } }
      let(:new_invalid_attribute) { { company: nil } }

      it 'does not update the requested experience entry' do
        expect { update_invalid_experience }.not_to(change { experience.reload.company })
      end

      it 'renders the errors remotely inside the edit page' do
        update_invalid_experience
        expect(response).to be_successful
      end
    end
  end

  describe 'DELETE #destroy' do
    let!(:path) { cv_experience_path experience }

    it 'destroys the requested experience entry' do
      expect { delete path }.to change(Experience, :count).by(-1)
    end

    it 'redirects to the CV display' do
      delete path
      expect(response).to redirect_to(cv_url)
    end
  end
end
