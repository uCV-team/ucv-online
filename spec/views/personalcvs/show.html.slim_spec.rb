require 'rails_helper'

RSpec.describe 'personalcvs/show', type: :view do
  before do
    @personalcv = assign(:personalcv, Personalcv.create!)
  end

  it 'renders attributes in <p>' do
    render
  end
end
