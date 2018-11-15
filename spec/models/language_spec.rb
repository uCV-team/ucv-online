require 'rails_helper'

RSpec.describe Language do
  it { is_expected.to validate_presence_of(:language) }
end
