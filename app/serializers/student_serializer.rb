class StudentSerializer < ActiveModel::Serializer
  attributes :id, :username, :first_name, :last_name, :profile_img, :location, :github_link
  has_many :languages_students 
end
