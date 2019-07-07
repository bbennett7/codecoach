require 'rails_helper'

RSpec.describe User, type: :model do
  it "is not valid without GitHub link if user type is coach" do
    user = User.new(username: "johnsmith72", first_name: "John", last_name: "Smith", user_type: "coach", email: "johnsmith@codecoach.com", location: "New York, NY", password: "password")

    expect(user).to_not be_valid
  end

  it "is valid without GitHub link if user type is student" do
    user = User.new(username: "janedoe89", first_name: "Jane", last_name: "Doe", user_type: "student", email: "janed@codecoach.com", location: "Chicago, IL", password: "password")

    expect(user).to be_valid
  end

  it "is not valid with invalid email" do
    user = User.new(username: "janedoe89", first_name: "Jane", last_name: "Doe", user_type: "student", email: "janed", location: "Chicago, IL", password: "password")

    expect(user).to_not be_valid
  end

  it "is not valid without user type" do
    user = User.new(username: "janedoe89", first_name: "Jane", last_name: "Doe", email: "janed", location: "Chicago, IL", password: "password")

    expect(user).to_not be_valid
  end

  it "can have a coach if user type is student" do
    student = User.new(username: "janedoe89", first_name: "Jane", last_name: "Doe", user_type: "student", email: "janed@codecoach.com", location: "Chicago, IL", password: "password")

    coach = User.new(username: "johnsmith72", first_name: "John", last_name: "Smith", user_type: "coach", email: "johnsmith@codecoach.com", github_link: "github.com/johnsmith", location: "New York, NY", password: "password")

    student.coach = coach
    coach.student = student

    expect(student.coach).to eq(coach)
    expect(coach.student).to eq(student)
  end

  it "has resources" do
    user = User.new(username: "johnsmith72", first_name: "John", last_name: "Smith", user_type: "coach", email: "johnsmith@codecoach.com", github_link: "github.com/johnsmith", location: "New York, NY", password: "password")

    lang = Language.new(name: "Ruby")

    first_resource = Resource.new(title: "Intro to Ruby", language: lang)
    second_resource = Resource.new(title: "Classes: Strings", language: lang)

    user.resources << first_resource
    user.resources << second_resource

    expect(user.resources).to eq([first_resource, second_resource])

  end

  it "has many languages" do
    first_lang = Language.new(name: "JavaScript")
    second_lang = Language.new(name: "Ruby")

    first_user = User.new(first_name: "John", last_name: "Smith")

    first_user.languages << first_lang
    first_user.languages << second_lang

    expect(first_user.languages).to eq([first_lang, second_lang])
  end
end
