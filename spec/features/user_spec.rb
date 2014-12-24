require "rails_helper"

describe User do
  describe "moderator" do
    scenario "can edit other user posts" do
      test_moderator = User.create!(email:"g@g.com", username:"max", password:"123", password_confirmation:"123", is_moderator:true )
      test_user = User.create!(email:"m@m.com", username:"post", password:"123", password_confirmation:"123", is_moderator:false )
      test_post = Post.create!(title:"Testing Post", description:"Testing Description", user_id:test_user.id)

      visit root_path
      click_on "signin-action"
      fill_in :email, with: "g@g.com"
      fill_in :password, with: "123"
      click_on "user-login-action"
      #-------------------------
      visit root_path
      click_on "post-show-action"
      click_on "post-edit-action"

      fill_in :post_title, with: "Mod edited post"
      click_on "post-create-action"

      expect(page).to have_content("Mod edited post")
    end

    scenario "can delete other user post"

    scenario "can delete other user comments"
  end

  describe "admin" do
    scenario "can make user an admin" do
      test_admin = User.create!(email:"g@g.com", username:"max", password:"123", password_confirmation:"123", is_admin:true, is_moderator:true )
      test_user = User.create!(email:"m@m.com", username:"post", password:"123", password_confirmation:"123", is_moderator:false )
      visit root_path
      click_on "signin-action"
      fill_in :email, with: "g@g.com"
      fill_in :password, with: "123"
      click_on "user-login-action"
      #-------------------------
      visit user_path(test_user)

      check :user_is_moderator
      click_on "user-update-submit"
      
      expect(page).to have_content("Moderator")
    end
  end
end
