require 'test_helper'

class BooksControllerTest < ActionDispatch::IntegrationTest
  test "should get top" do
    get books_top_url
    assert_response :success
  end

  test "should get books" do
    get books_books_url
    assert_response :success
  end

  test "should get show" do
    get books_show_url
    assert_response :success
  end

  test "should get edit" do
    get books_edit_url
    assert_response :success
  end

end
