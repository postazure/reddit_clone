require "rails_helper"

describe User do
  describe "navigate from " do
    scenario "post show"

    scenario "comment show"

    scenario "navbar"
  end

  describe "show view" do
    scenario "has elements" do
      expect(page).to have_content("user-username")
      expect(page).to have_content("user-post-count")
      expect(page).to have_content("user-lastpost-timer")
      expect(page).to have_content("user-comment-count")
      expect(page).to have_content("user-lastcomment-timer")
    end

  end


end
