require 'rails_helper'

RSpec.describe 'personalcvs/index', type: :view do
  before do
    assign(:personalcvs, [
             Personalcv.create!,
             Personalcv.create!
           ])
  end

  it 'renders a list of personalcvs' do
    render
  end
end
