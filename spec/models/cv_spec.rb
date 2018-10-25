require 'rails_helper'

RSpec.describe Cv do
  it { is_expected.to validate_length_of(:about).is_at_most(250) }
end
