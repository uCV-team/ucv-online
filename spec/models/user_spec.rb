require 'rails_helper'

RSpec.describe User, type: :model do
  it 'creates a new user' do
    user = described_class.create!(first_name: 'Bobby', last_name: 'Bobbson',
                                   email: 'bobby.bobbson@bobb.son', password: 'pa$$word123')
    expect(user.email).to eq 'bobby.bobbson@bobb.son'
  end
end
