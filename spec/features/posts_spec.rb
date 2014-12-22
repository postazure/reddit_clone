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

  scenario "#edit" do
    test_post = Post.create!(title:"Testing Post", description:"Testing Description")

    visit root_path
    click_on "post-show-action"
    click_on "post-edit-action"
    #login info after authorization
    fill_in :post_title, with:"New Title"
    fill_in :post_description, with:"New Description"
    click_on "post-create-action"

    expect(page).to have_link("post-edit-action")
    expect(page.current_path).to eq(post_path(test_post))
  end

  scenario "#delete" do
    test_post = Post.create!(title:"Testing Post", description:"Testing Description")

    visit root_path
    click_on "post-show-action"
    click_on "post-delete-action"
    #login info after authorization

    expect(page).to have_no_link(test_post.title)
    expect(page.current_path).to eq(root_path)
  end
end
