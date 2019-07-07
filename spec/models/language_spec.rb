require 'rails_helper'

RSpec.describe Language, type: :model do
  it "is valid with name" do
    expect(Language.new(name: "Ruby")).to be_valid
  end

  it "is not valid without a name" do
    language = Language.new(name: nil)
    expect(language).to_not be_valid
  end

  it "has a name" do
    language = Language.new(name: "Python")
    expect(language.name).to eq("Python")
  end

end
