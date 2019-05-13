class CreateLanguagesMentors < ActiveRecord::Migration[5.2]
  def change
    create_table :languages_mentors do |t|
      t.integer :language_id
      t.integer :mentor_id

      t.timestamps
    end
  end
end
