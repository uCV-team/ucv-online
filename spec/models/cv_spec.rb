require 'rails_helper'

RSpec.describe Cv do
  it { is_expected.to validate_length_of(:about).is_at_most(120) }

  describe '#full_text_search' do
    subject(:user) { create(:user, :with_locations, cv: build(:cv, :complete_cv)) }

    context 'with full keywords' do
      it 'searches cv attributes', :aggregate_failures do
        expect(user.cv).to be_pg_searched_by('programming')
        expect(user.cv).to be_pg_searched_by('cooking')
        expect(user.cv).to be_pg_searched_by('friendly')
      end

      it 'searches education attributes', :aggregate_failures do
        expect(user.cv).to be_pg_searched_by('bachelor')
        expect(user.cv).to be_pg_searched_by('learned')
        expect(user.cv).to be_pg_searched_by('ETH')
      end

      it 'searches language attributes', :aggregate_failures do
        expect(user.cv).to be_pg_searched_by('english')
        expect(user.cv).to be_pg_searched_by('b2')
      end
    end

    context 'with abbreviations' do
      it 'searches cv attributes', :aggregate_failures do
        expect(user.cv).to be_pg_searched_by('prog')
        expect(user.cv).to be_pg_searched_by('ski')
        expect(user.cv).to be_pg_searched_by('friend')
      end

      it 'searches experience attributes', :aggregate_failures do
        expect(user.cv).to be_pg_searched_by('Ren')
        expect(user.cv).to be_pg_searched_by('soft')
        expect(user.cv).to be_pg_searched_by('dev')
      end

      it 'searches location attributes', :aggregate_failures do
        expect(user.cv).to be_pg_searched_by('york')
        expect(user.cv).to be_pg_searched_by('united sta')
      end
    end

    context 'with inexistent keywords' do
      it 'searches cv attributes', :aggregate_failures do
        expect(user.cv).not_to be_pg_searched_by('guitar')
        expect(user.cv).not_to be_pg_searched_by('bread')
        expect(user.cv).not_to be_pg_searched_by('wine')
      end
    end
  end
end
