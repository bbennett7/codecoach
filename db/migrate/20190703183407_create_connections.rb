class CreateConnections < ActiveRecord::Migration[5.2]
  def change
    create_table :connections do |t|
      t.references :coach, foreign_key: { to_table: :users }, index: { unique: true}
      t.references :student, foreign_key: { to_table: :users }, index: { unique: true}

      t.timestamps
    end
  end
end
