require 'rails_helper'

RSpec.describe CvsHelper do
  describe '#full_name' do
    let(:user) { build_stubbed(:user, first_name: 'John', last_name: 'Oliver') }

    it 'returns the full name as a string' do
      expect(helper.full_name(user)).to eq 'John Oliver'
    end
  end

  shared_examples 'period' do
    let(:started_on) { Date.new(2014, 1, 1) }
    let(:ended_on) { Date.new(2018, 1, 1) }

    context 'with both dates provided' do
      it 'returns the period as a single string' do
        expect(period_method).to eq both_dates_provided
      end
    end

    context 'with only started_on provided' do
      let(:ended_on) { nil }

      it 'returns the period from the input date to present' do
        expect(period_method).to eq start_date_provided
      end
    end

    context 'with only ended_on provided' do
      let(:started_on) { nil }

      it 'returns an empty string' do
        expect(period_method).to eq no_date_provided
      end
    end

    context 'with no dates provided' do
      let(:started_on) { nil }
      let(:ended_on) { nil }

      it 'returns an empty string' do
        expect(period_method).to eq no_date_provided
      end
    end
  end

  describe '#study_period' do
    it_behaves_like 'period' do
      subject(:period_method) { helper.study_period(started_on, ended_on) }

      let(:both_dates_provided) { '2014 - 2018' }
      let(:start_date_provided) { '2014 - Present' }
      let(:no_date_provided) { '' }
    end
  end

  describe '#work_period' do
    it_behaves_like 'period' do
      subject(:period_method) { helper.work_period(started_on, ended_on) }

      let(:both_dates_provided) { 'January 2014 - January 2018' }
      let(:start_date_provided) { 'January 2014 - Present' }
      let(:no_date_provided) { '' }
    end
  end
end
