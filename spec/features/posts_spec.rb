require "rails_helper"

feature PostsController do
  feature "while current_user exists" do
    scenario "#new" do
      #login info after authorization
      User.create!(email:"g@g.com", username:"max", password:"123", password_confirmation:"123" )
      visit root_path
      click_on "signin-action"

      fill_in :email, with: "g@g.com"
      fill_in :password, with: "123"
      click_on "user-login-action"
      # -------------

      visit root_path
      click_on "post-new-action"

      fill_in :post_title, with: "Test Post"
      fill_in :post_description, with: "Test Description"
      click_on "post-create-action"

      expect(page).to have_link("post-edit-action")
    end

    scenario "#edit" do
      #login info after authorization
      User.create!(email:"g@g.com", username:"max", password:"123", password_confirmation:"123" )
      visit root_path
      click_on "signin-action"

      fill_in :email, with: "g@g.com"
      fill_in :password, with: "123"
      click_on "user-login-action"
      # -------------
      test_post = Post.create!(title:"Testing Post", description:"Testing Description")

      visit root_path
      click_on "post-show-action"
      click_on "post-edit-action"
      fill_in :post_title, with:"New Title"
      fill_in :post_description, with:"New Description"
      click_on "post-create-action"

      expect(page).to have_link("post-edit-action")
      expect(page.current_path).to eq(post_path(test_post))
    end

    scenario "#delete" do
      #login info after authorization
      User.create!(email:"g@g.com", username:"max", password:"123", password_confirmation:"123" )
      visit root_path
      click_on "signin-action"

      fill_in :email, with: "g@g.com"
      fill_in :password, with: "123"
      click_on "user-login-action"
      # -------------
      test_post = Post.create!(title:"Testing Post", description:"Testing Description")

      visit root_path
      click_on "post-show-action"
      click_on "post-delete-action"

      expect(page).to have_no_link(test_post.title)
      expect(page.current_path).to eq(root_path)
    end
  end
end
