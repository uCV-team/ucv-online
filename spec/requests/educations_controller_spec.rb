require 'rails_helper'

RSpec.describe EducationsController, type: :controller do
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }
  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }
  let(:valid_session) { {} }

  describe "GET #index" do
    it "returns a success response" do
      Education.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      education = Education.create! valid_attributes
      get :show, params: {id: education.to_param}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "GET #new" do
    it "returns a success response" do
      get :new, params: {}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "GET #edit" do
    it "returns a success response" do
      education = Education.create! valid_attributes
      get :edit, params: {id: education.to_param}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Education" do
        expect {
          post :create, params: {education: valid_attributes}, session: valid_session
        }.to change(Education, :count).by(1)
      end

      it "redirects to the created education" do
        post :create, params: {education: valid_attributes}, session: valid_session
        expect(response).to redirect_to(Education.last)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: {education: invalid_attributes}, session: valid_session
        expect(response).to be_successful
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested education" do
        education = Education.create! valid_attributes
        put :update, params: {id: education.to_param, education: new_attributes}, session: valid_session
        education.reload
        skip("Add assertions for updated state")
      end

      it "redirects to the education" do
        education = Education.create! valid_attributes
        put :update, params: {id: education.to_param, education: valid_attributes}, session: valid_session
        expect(response).to redirect_to(education)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'edit' template)" do
        education = Education.create! valid_attributes
        put :update, params: {id: education.to_param, education: invalid_attributes}, session: valid_session
        expect(response).to be_successful
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested education" do
      education = Education.create! valid_attributes
      expect {
        delete :destroy, params: {id: education.to_param}, session: valid_session
      }.to change(Education, :count).by(-1)
    end

    it "redirects to the educations list" do
      education = Education.create! valid_attributes
      delete :destroy, params: {id: education.to_param}, session: valid_session
      expect(response).to redirect_to(educations_url)
    end
  end

end
