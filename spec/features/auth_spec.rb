require "rails_helper"

feature "User Auth" do
  scenario "#register" do
    visit root_path
    click_on "signup-action"

    fill_in :username
    fill_in :email
    fill_in :password
    fill_in :password_confirmation

    click_on "user-create-action"

    expect(page).to have_link("Sign Out")
  end
end
