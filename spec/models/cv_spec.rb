require 'rails_helper'

RSpec.describe Cv do
  it { is_expected.to validate_presence_of(:about) }
  it { is_expected.to validate_presence_of(:birth_date) }
  it { is_expected.to validate_presence_of(:future_plans) }
  it { is_expected.to validate_presence_of(:phone_number) }
  it { is_expected.to validate_presence_of(:photo) }
  it { is_expected.to validate_presence_of(:skills_and_interests) }
  it { is_expected.to validate_presence_of(:working_skills) }
end
