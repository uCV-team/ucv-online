require 'rails_helper'

RSpec.describe SearchesHelper do
  let(:latitude) { 40.7143528 }
  let(:longitude) { -74.0059731 }
  let(:name) { 'John Williams' }

  describe '#coordinates_list' do
    subject { helper.coordinates_list(full_text_search_results) }

    context 'with no search results' do
      let(:full_text_search_results) { [] }
      let(:locations_list) { [] }

      it { is_expected.to eq locations_list }
    end

    context 'with location/s available' do
      let(:full_text_search_results) { create_list(:cv, 1, user: build(:user, :with_locations)) }
      let(:locations_list) do
        [
          {
            name: name,
            location: {
              lat: latitude,
              lng: longitude
            }
          }
        ]
      end

      it { is_expected.to eq locations_list }
    end

    context 'with no location/s available' do
      let(:full_text_search_results) { create_list(:cv, 1, user: build(:user)) }
      let(:locations_list) { [] }

      it { is_expected.to eq locations_list }
    end
  end
end
