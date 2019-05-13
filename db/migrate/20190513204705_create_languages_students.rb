class CreateLanguagesStudents < ActiveRecord::Migration[5.2]
  def change
    create_table :languages_students do |t|
      t.integer :language_id
      t.integer :student_id

      t.timestamps
    end
  end
end
