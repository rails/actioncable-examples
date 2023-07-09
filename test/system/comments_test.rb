require 'application_system_test_case'

class CommentsTest < ApplicationSystemTestCase
  def setup
    visit root_path

    click_on 'Snoop Dogg'
    click_on 'Messages with live comments'
    click_on 'Tha Shiznit'
  end

  test 'add comment' do
    fill_in 'content', with: 'Yezzir'
    click_on 'Post comment'

    assert_text 'Yezzir'
  end

  test 'see new comment' do
    sleep(1) # Wait for the client-side connection to be established

    message = messages(:tha_shiznit)
    other_user = users(:big)
    comment = message.comments.create!(content: 'Yezzir', user: other_user)

    assert_text "Comment by #{other_user.name}"
    assert_text comment.content
  end
end
