class CreateConnections < ActiveRecord::Migration[5.2]
  def change
    create_table :connections do |t|
      t.integer :coach_user_id
      t.integer :student_user_id

      t.timestamps
    end
  end
end
