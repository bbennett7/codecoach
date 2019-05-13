class CreateLanguagesMentors < ActiveRecord::Migration[5.2]
  def change
    create_table :languages_mentors do |t|

      t.timestamps
    end
  end
end
