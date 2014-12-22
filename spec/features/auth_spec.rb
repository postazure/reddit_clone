require "rails_helper"

feature "User Auth" do

  feature "Sign In Out Up" do
    scenario "#register" do
      visit root_path
      click_on "signup-action"

      fill_in :user_username, with: "post"
      fill_in :user_email, with: "g@g.com"
      fill_in :user_password, with: "123"
      fill_in :user_password_confirmation, with: "123"

      click_on "user-create-action"

      expect(page).to have_link("signout-action")
    end

    scenario "#signout" do
      visit root_path
      click_on "signup-action"

      fill_in :user_username, with: "post"
      fill_in :user_email, with: "g@g.com"
      fill_in :user_password, with: "123"
      fill_in :user_password_confirmation, with: "123"

      click_on "user-create-action"

      visit root_path
      click_on "signout-action"

      expect(page).to have_link("signup-action")
    end

    scenario "#signin" do
      User.create!(email:"g@g.com", username:"max", password:"123", password_confirmation:"123" )
      visit root_path
      click_on "signin-action"

      fill_in :email, with: "g@g.com"
      fill_in :password, with: "123"
      click_on "user-login-action"

      expect(page).to have_link("signout-action")
    end
  end

  feature "force login" do
    scenario "#new" do
      visit root_path
      click_on "post-new-action"

      expect(page.current_path).to eq(signin_path)
    end

    scenario "#show" do
      test_post = Post.create!(title:"Testing Post", description:"Testing Description")
      visit root_path
      click_on "post-show-action"

      expect(page).to have_no_link("post-edit-action")
    end
  end
end
