require 'test_helper'
require 'support/i18n_helpers'

class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
  include Devise::Test::IntegrationHelpers
  include I18nHelpers
end
