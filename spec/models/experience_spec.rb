require 'rails_helper'

RSpec.describe Experience, type: :model do
  it { is_expected.to validate_presence_of(:company) }
  it { is_expected.to validate_presence_of(:title) }
end
