require 'rails_helper'

RSpec.describe Cv do
  it { is_expected.to validate_length_of(:about).is_at_most(120) }

  describe '#full_text_search' do
    subject { create :cv }

    context 'with full keywords' do
      it { is_expected.to be_pg_searched_by('programming') }
      it { is_expected.to be_pg_searched_by('cooking') }
      it { is_expected.to be_pg_searched_by('friendly') }
    end

    context 'with abbreviations' do
      it { is_expected.to be_pg_searched_by('prog') }
      it { is_expected.to be_pg_searched_by('ski') }
      it { is_expected.to be_pg_searched_by('friend') }
    end
  end
end
