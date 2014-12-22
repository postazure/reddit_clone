require "rails_helper"
require "user"


describe User do
  it "validates the presence of the username" do
    test_user = User.new()
    test_user.valid?
    expect(test_user.errors[:username]).to include("can't be blank")
  end

  it "validates the uniqueness of the username" do
    established_user = User.create!(username: "max", email:"g@g.com", password:"123")
    test_user = User.new(username: "max")
    test_user.valid?
    expect(test_user.errors[:username]).to include("has already been taken")
  end


  it "validates the presence of the email" do
    test_user = User.new()
    test_user.valid?
    expect(test_user.errors[:email]).to include("can't be blank")
  end

  it "validates the uniqueness of the email" do
    established_user = User.create!(username: "max", email:"g@g.com", password:"123")
    test_user = User.new(email: "g@g.com")
    test_user.valid?
    expect(test_user.errors[:email]).to include("has already been taken")
  end



end
