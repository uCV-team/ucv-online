require 'rails_helper'

RSpec.describe Language do
  it { is_expected.to validate_presence_of(:language) }
  it { is_expected.to validate_inclusion_of(:level).in_array(Language::CEFR_LEVELS) }
end
