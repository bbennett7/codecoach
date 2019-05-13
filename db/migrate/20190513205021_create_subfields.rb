class CreateSubfields < ActiveRecord::Migration[5.2]
  def change
    create_table :subfields do |t|
      t.string :name
      t.integer :language_id 

      t.timestamps
    end
  end
end
