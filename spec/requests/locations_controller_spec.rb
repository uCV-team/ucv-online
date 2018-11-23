require 'rails_helper'

RSpec.describe LocationsController, type: :request do
  let(:user) { create :user }
  let(:location) { create :location, user: user }
  let(:invalid_params) { { original_address: nil } }

  before { sign_in user }

  describe 'GET #new' do
    it 'returns a success response' do
      get new_location_path, xhr: true
      expect(response).to be_successful
    end
  end

  describe 'GET #edit' do
    it 'returns a success response' do
      get edit_location_path(location), xhr: true
      expect(response).to be_successful
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      subject(:create_location) { post locations_path, params: location_params }

      let(:location_params) { { location: attributes_for(:location) } }

      it 'creates a new location' do
        expect { create_location }.to change(Location, :count).by(1)
      end

      it 'redirects to the CV display' do
        create_location
        expect(response).to redirect_to(cv_url)
      end
    end

    context 'with invalid params' do
      subject(:create_invalid_location) { post locations_path, params: invalid_location_params, xhr: true }

      let(:invalid_location_params) { { location: invalid_params } }

      it 'does not create a new location' do
        expect { create_invalid_location }.not_to change(Location, :count)
      end

      it 'renders the errors' do
        create_invalid_location
        expect(response).to be_successful
      end
    end
  end

  describe 'PUT #update' do
    context 'with valid params' do
      subject(:update_location) { put location_path location, params: location_params }

      let(:location_params) { { location: new_attribute } }
      let(:new_attribute) { { original_address: new_original_address } }
      let(:new_original_address) { 'Bahnhofstrasse 50, 8400 Winterthur' }

      it 'updates the requested location' do
        expect { update_location }.to change { location.reload.original_address }.to(new_original_address)
      end

      it 'redirects to the CV display' do
        update_location
        expect(response).to redirect_to(cv_url)
      end
    end

    context 'with invalid params' do
      subject(:update_invalid_location) { put location_path(location), params: invalid_location_params, xhr: true }

      let(:invalid_location_params) { { location: new_invalid_attribute } }
      let(:new_invalid_attribute) { { original_address: nil } }

      it 'does not update the requested location' do
        expect { update_invalid_location }.not_to(change { location.reload.original_address })
      end

      it 'renders the errors' do
        update_invalid_location
        expect(response).to be_successful
      end
    end
  end

  describe 'DELETE #destroy' do
    let!(:path) { location_path location }

    it 'destroys the requested location' do
      expect { delete path }.to change(Location, :count).by(-1)
    end

    it 'redirects to the CV display' do
      delete path
      expect(response).to redirect_to(cv_url)
    end
  end
end
