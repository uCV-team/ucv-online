require 'rails_helper'

RSpec.describe 'personalcvs/edit', type: :view do
  let(:personalcv) { assign(:personalcv, Personalcv.create!) }

  it 'renders the edit personalcv form' do
    render

    assert_select 'form[action=?][method=?]', personalcv_path(personalcv), 'post' do
    end
  end
end
