require 'rails_helper'

RSpec.describe 'personalcvs/new', type: :view do
  before do
    assign(:personalcv, Personalcv.new)
  end

  it 'renders new personalcv form' do
    render

    assert_select 'form[action=?][method=?]', personalcvs_path, 'post' do
    end
  end
end
