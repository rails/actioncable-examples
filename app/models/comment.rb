class Comment < ApplicationRecord
  belongs_to :message
  belongs_to :user

  after_commit { CommentRelayJob.perform_later(self) }
end
