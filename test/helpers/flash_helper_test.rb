require 'test_helper'

class FlashHelperTest < ActionView::TestCase
  test 'alert_class_for return correct value for bootstrap in case of success' do
    assert_equal 'alert-success', alert_class_for('success')
  end

  test 'alert_class_for return correct value for bootstrap in case of an error' do
    assert_equal 'alert-danger', alert_class_for('error')
  end

  test 'alert_class_for return correct value for bootstrap in case of an alert' do
    assert_equal 'alert-warning', alert_class_for('alert')
  end

  test 'alert_class_for return correct value for bootstrap in case of a notice' do
    assert_equal 'alert-info', alert_class_for('notice')
  end

  test 'alert_class_for also works with symbol values' do
    assert_equal 'alert-warning', alert_class_for(:alert)
  end

  test 'alert_class_for return type as string if the type is unknown' do
    assert_equal 'unknown_class', alert_class_for(:unknown_class)
  end
end
