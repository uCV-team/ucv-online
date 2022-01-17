require 'test_helper'

class DragAndDropViewTest < ApplicationSystemTestCase
  driven_by :selenium_chrome_headless

  setup do
    ActionController::Base.allow_forgery_protection = true
    @user = users(:john)
    passwordless_sign_in(@user)
  end

  test 'user can sort experiences' do
    skip 'test cases of sorting are not compatible with capybara version'
    experience1 = experiences(:john_experience)
    experience2 = experiences(:john_experience2)
    experience3 = experiences(:john_experience3)

    assert_not experience1.cv.custom_experience_sort

    visit cv_section_path(@user.subdomain)

    source = page.driver.browser.find_element(id: "sort_exp_#{experience1.id}")
    target = page.driver.browser.find_element(id: "sort_exp_#{experience3.id}")

    page.driver.browser.action.drag_and_drop(source, target).perform

    wait_for_ajax

    assert experience1.cv.reload.custom_experience_sort
    assert_equal 0, experience1.reload.position
    assert_equal 2, experience2.reload.position
    assert_equal 1, experience3.reload.position

    refresh

    assert_equal 0, experience1.reload.position
    assert_equal 2, experience2.reload.position
    assert_equal 1, experience3.reload.position
  end

  test 'user can sort educations' do
    skip 'test cases of sorting are not compatible with capybara version'
    education1 = educations(:john_education)
    education2 = educations(:john_education2)

    assert_not education1.cv.custom_education_sort

    visit cv_section_path(@user.subdomain)

    source = page.driver.browser.find_element(id: "sort_ed_#{education2.id}")
    target = page.driver.browser.find_element(id: "sort_ed_#{education1.id}")

    page.driver.browser.action.drag_and_drop(source, target).perform

    wait_for_ajax

    assert education1.cv.reload.custom_education_sort
    assert_equal 1, education1.reload.position
    assert_equal 0, education2.reload.position

    refresh

    assert_equal 1, education1.reload.position
    assert_equal 0, education2.reload.position
  end
end
