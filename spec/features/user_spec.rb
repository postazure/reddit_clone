require "rails_helper"

describe User do
  describe "show view" do
    scenario "has elements" do
      test_user = User.create!(email:"g@g.com", username:"max", password:"123", password_confirmation:"123" )
      test_post = Post.create!(title:"Testing Post", description:"Testing Description", user_id:test_user.id)
      visit root_path
      click_on "signin-action"

      fill_in :email, with: "g@g.com"
      fill_in :password, with: "123"
      click_on "user-login-action"
      #---------------------------

      visit root_path
      click_on "user-show-action"

      expect(page.current_path).to have_content(user_path(test_user))
      expect(page).to have_content("max")
    end

  end


end
