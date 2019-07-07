require 'rails_helper'

RSpec.describe Resource, type: :model do
  it "belongs to a language" do
    lang = Language.new(name: "Ruby")

    first_resource = Resource.new(title: "Intro to Ruby", language: lang)
    second_resource = Resource.new(title: "Classes: Strings", language: lang)

    expect(first_resource.language).to eq(lang)
  end

  it "belongs to a user" do
    user = User.new(username: "johnsmith72", first_name: "John", last_name: "Smith", user_type: "coach", email: "johnsmith@codecoach.com", github_link: "github.com/johnsmith", location: "New York, NY", password: "password")

    first_resource = Resource.new(title: "Intro to Ruby")
    second_resource = Resource.new(title: "Classes: Strings")

    user.resources << first_resource
    user.resources << second_resource

    expect(first_resource.user).to eq(user)
    expect(second_resource.user).to eq(user)
  end
end
