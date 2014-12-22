require "rails_helper"

feature "User Auth" do
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
end
