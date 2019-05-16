class Resource < ApplicationRecord
  belongs_to :mentor
  belongs_to :language
  belongs_to :subfield

  validates :website, presence: { message: 'Website cannot be blank.' }
  validates :title, presence: { message: 'Title cannot be blank.' }
  validates :url, presence: { message: 'URL cannot be blank.' }
  validates :language_id, presence: { message: 'Language cannot be blank.' }
  validates :student_rating, numericality: { less_than_or_equal_to: 10 }

  def self.top_resources
    Resource.all.collect do |resource|
      if resource.student_rating == 10
        resource
      end
    end 
  end
end
