require 'rails_helper'

RSpec.describe LanguagesHelper do
  describe '#cefr_level' do
    it 'returns the corresponding translated CEFR level' do
      expect(helper.cefr_level('a1')).to eq 'A1 - Beginner'
    end
  end

  describe '#cefr_level_options' do
    let(:cefr_options) do
      {
        a1: 'A1 - Beginner',
        a2: 'A2 - Elementary',
        b1: 'B1 - Intermediate',
        b2: 'B2 - Upper intermediate',
        c1: 'C1 - Advanced',
        c2: 'C2 - Proficiency'
      }
    end

    it 'returns a hash with the options' do
      expect(helper.cefr_level_options).to eq cefr_options
    end
  end
end
