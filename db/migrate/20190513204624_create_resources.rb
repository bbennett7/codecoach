class CreateResources < ActiveRecord::Migration[5.2]
  def change
    create_table :resources do |t|
      t.string :website
      t.string :title
      t.string :url
      t.integer :language_id
      t.integer :subfield_id
      t.integer :user_id
      t.boolean :read, default: false
      t.integer :student_rating

      t.timestamps
    end
  end
end
