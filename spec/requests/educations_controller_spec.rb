require 'rails_helper'

RSpec.describe EducationsController, type: :request do
  let(:user) { create :user, cv: build(:cv, :complete_cv) }
  let(:education) { user.cv.educations.first }
  let(:invalid_params) { { school: nil } }

  before { sign_in user }

  describe 'GET #new' do
    it 'returns a success response' do
      get new_cv_education_path, xhr: true
      expect(response).to be_successful
    end
  end

  describe 'GET #edit' do
    it 'returns a success response' do
      get edit_cv_education_path(education), xhr: true
      expect(response).to be_successful
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      subject(:create_education) { post cv_educations_path, params: education_params }

      let(:education_params) { { education: attributes_for(:education) } }

      it 'creates a new education entry' do
        expect { create_education }.to change(Education, :count).by(1)
      end

      it 'redirects to the CV display' do
        create_education
        expect(response).to redirect_to(cv_url)
      end
    end

    context 'with invalid params' do
      subject(:create_invalid_education) { post cv_educations_path, params: invalid_education_params, xhr: true }

      let(:invalid_education_params) { { education: invalid_params } }

      it 'does not create a new education entry' do
        expect { create_invalid_education }.not_to change(Education, :count)
      end

      it 'renders the errors' do
        create_invalid_education
        expect(response).to be_successful
      end
    end
  end

  describe 'PUT #update' do
    context 'with valid params' do
      subject(:update_education) { put cv_education_path education, params: education_params }

      let(:education_params) { { education: new_attribute } }
      let(:new_attribute) { { degree: new_degree } }
      let(:new_degree) { 'Master of Science' }

      it 'updates the requested education entry' do
        expect { update_education }.to change { education.reload.degree }.to(new_degree)
      end

      it 'redirects to the CV display' do
        update_education
        expect(response).to redirect_to(cv_url)
      end
    end

    context 'with invalid params' do
      subject(:update_invalid_education) do
        put cv_education_path(education), params: invalid_education_params, xhr: true
      end

      let(:invalid_education_params) { { education: new_invalid_attribute } }
      let(:new_invalid_attribute) { { school: nil } }

      it 'does not update the requested education entry' do
        expect { update_invalid_education }.not_to(change { education.reload.school })
      end

      it 'renders the errors' do
        update_invalid_education
        expect(response).to be_successful
      end
    end
  end

  describe 'DELETE #destroy' do
    let!(:path) { cv_education_path education }

    it 'destroys the requested education entry' do
      expect { delete path }.to change(Education, :count).by(-1)
    end

    it 'redirects to the CV display' do
      delete path
      expect(response).to redirect_to(cv_url)
    end
  end
end
