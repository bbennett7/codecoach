class Resource < ApplicationRecord
  belongs_to :mentor
  belongs_to :language
  belongs_to :subfield

  validates :website, presence: { message: 'Website cannot be blank.' }
  validates :title, presence: { message: 'Title cannot be blank.' }
  validates :url, presence: { message: 'URL cannot be blank.' }
  validates :language_id, presence: { message: 'Language cannot be blank.' }
end
