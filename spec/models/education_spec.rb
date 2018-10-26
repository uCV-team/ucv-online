require 'rails_helper'

RSpec.describe Education do
  it { is_expected.to validate_presence_of(:school) }
end
