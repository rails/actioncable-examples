require "test_helper"

class ApplicationCable::ConnectionTest < ActionCable::Connection::TestCase
  test "connects with cookies" do
    user = users(:dogg)
    cookies.encrypted[:user_id] = user.id
  
    connect
  
    assert_equal connection.current_user, user
  end

  test "does not connect with params" do
    user = users(:dogg)

    assert_reject_connection { connect(params: { user_id: user.id }) }
  end

  test "does not connect when user does not exist" do
    cookies.encrypted[:user_id] = 42

    assert_reject_connection { connect }
  end
end
