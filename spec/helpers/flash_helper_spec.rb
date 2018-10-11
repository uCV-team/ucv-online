require 'rails_helper'

RSpec.describe FlashHelper do
  describe '#alert_class_for' do
    it 'returns the correct value for bootstrap in case of success' do
      expect(helper.alert_class_for('success')).to eq('alert-success')
    end

    it 'returns the correct value for bootstrap in case of an error' do
      expect(helper.alert_class_for('error')).to eq('alert-danger')
    end

    it 'returns the correct value for bootstrap in case of an alert' do
      expect(helper.alert_class_for('alert')).to eq('alert-warning')
    end

    it 'returns the correct value for bootstrap in case of a notice' do
      expect(helper.alert_class_for('notice')).to eq('alert-info')
    end

    it 'also works with symbol values' do
      expect(helper.alert_class_for(:alert)).to eq('alert-warning')
    end

    it 'returns the type as string if the type is unknown' do
      expect(helper.alert_class_for(:unknown_class)).to eq('unknown_class')
    end
  end
end
