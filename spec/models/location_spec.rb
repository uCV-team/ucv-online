require 'rails_helper'

RSpec.describe Location, type: :model do
  it { is_expected.to validate_presence_of(:original_address) }
  it { is_expected.to validate_numericality_of(:radius).is_greater_than_or_equal_to(0) }
end
