require "rails_helper"

feature CommentsController do
  scenario "#new" do
    #----Login
    test_user = User.create!(email:"g@g.com", username:"max", password:"123", password_confirmation:"123" )
    visit root_path
    click_on "signin-action"

    fill_in :email, with: "g@g.com"
    fill_in :password, with: "123"
    click_on "user-login-action"
    #----------

    test_post = Post.create!(title:"Testing Post", description:"Testing Description", user_id:test_user.id)

    visit root_path
    click_on "post-show-action"
    click_on "comment-new-action"

    fill_in :comment_description, with: "Test Comment"
    click_on "comment-create-action"

    expect(page).to have_content("Test Comment")
    save_and_open_page
    expect(page).to have_content("max")
    expect(page.current_path).to eq(post_path(test_post))
  end
end
