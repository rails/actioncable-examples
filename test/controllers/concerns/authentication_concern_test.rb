require 'test_helper'

class AuthenticationConcernTest < ActionController::TestCase
  setup do
    @controller = SessionsController.new
  end

  def test_unauthenticate_user
    # should disconnect all the connections established for current users
    user = User.create(name: 'Sticky Fingaz')

    post :create, params: { user_id: user.id }

    ActionCable.server.expects(:disconnect).with(has_entries(current_user: user))

    delete :destroy
  end
end
