require "test_helper"

class LoginCanViewUserPostsTest < Capybara::Rails::TestCase
  test "Cannot view posts when not logged in" do
    me = User.create! username: "lavoisier", password: "12345678"
    visit root_path

    assert_content page, "Please Sign In"
    refute_content page, "Goodbye All!"
  end

  test "Cann view posts after log in" do
    visit root_path
    assert_content page, "Hello World"
    refute_content page, "Goodbye All!"
  end

end
