class Resource < ApplicationRecord
  belongs_to :mentor
  belongs_to :language
  belongs_to :subfield

  validates :website, presence: { message: 'cannot be blank.' }
  validates :title, presence: { message: 'cannot be blank.' }
  validates :url, presence: { message: 'cannot be blank.' }
  validates :language_id, presence: { message: 'cannot be blank.' }
  validates :subfield, presence: { message: 'cannot be blank.' }
  validates :student_rating, numericality: { less_than_or_equal_to: 10 }, :if => :student_rating


  scope :top_resources, -> {where(student_rating: 10)}
  
  # def self.top_resources
  #   where(student_rating: 10)
  # end

end
