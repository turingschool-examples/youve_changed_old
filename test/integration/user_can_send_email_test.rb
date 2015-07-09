require 'test_helper'

class UserCanSendEmailTest < ActionDispatch::IntegrationTest
  include Capybara::DSL

  def setup
    Capybara.app = YouveChanged::Application
    ActionMailer::Base.deliveries.clear
    reset_session!
  end

  def test_loads_homepage
    visit '/'
    assert page.has_content?("Welcome")
  end

  def test_logged_in_user_sees_email_form
    User.create(name: "Horace",
                       email: "horace@turing.io",
                       password: "password")

    visit '/'
    click_on "Login"

    fill_in "email", with: "horace@turing.io"
    fill_in "password", with: "password"
    click_on "Submit"

    assert_equal '/', current_path
    assert page.has_content?("Horace")
    assert page.has_css?("form#email-form")

    assert ActionMailer::Base.deliveries.empty?

    fill_in "email", with: "brett@isawesome.com"
    click_on "Submit"

    assert_equal 1, ActionMailer::Base.deliveries.count
    mail = ActionMailer::Base.deliveries.last
    #mail.body.parts.last.body.raw_source <- read the source of the message
    assert_equal ["brett@isawesome.com"], mail.to
    assert_equal "You've changed.", mail.subject
  end
end
