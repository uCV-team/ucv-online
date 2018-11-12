require 'rails_helper'

RSpec.describe CvsHelper do
  describe '#study_period' do
    let(:started_on) { Date.new(2014, 1, 1) }
    let(:ended_on) { Date.new(2018, 1, 1) }

    it 'returns the study period as a single string' do
      expect(helper.study_period(started_on, ended_on)).to eq '2014 - 2018'
    end
  end
end
