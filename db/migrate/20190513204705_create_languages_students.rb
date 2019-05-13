class CreateLanguagesStudents < ActiveRecord::Migration[5.2]
  def change
    create_table :languages_students do |t|

      t.timestamps
    end
  end
end
