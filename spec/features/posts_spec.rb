require "rails_helper"

feature PostsController do
  scenario "#new" do
    visit root_path
    click_on "post-new-action"
    #login info after authorization
    fill_in :post_title, with: "Test Post"
    fill_in :post_description, with: "Test Description"
    click_on "post-create-action"

    expect(page).to have_link("post-edit-action")
  end


end
