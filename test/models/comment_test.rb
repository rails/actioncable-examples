require "test_helper"

class CommentTest < ActiveSupport::TestCase
  include ActiveJob::TestHelper

  test "enqueues CommentRelayJob after create" do
    assert_enqueued_with(job: CommentRelayJob) do
      Comment.create!(content: "Hello", message: messages(:tha_shiznit), user: users(:dogg))
    end
  end
end
