require "minitest/mock"
require "test_helper"

class CommentRelayJobTest < ActiveJob::TestCase
  test "that account is charged" do
    mock = Minitest::Mock.new
    mock.expect :broadcast, true, [String, Hash]

    ActionCable.stub :server, mock do
      comment = comments(:one)
      CommentRelayJob.perform_now(comment)
    end

    assert_mock mock
  end
end
