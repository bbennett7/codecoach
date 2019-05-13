class CreateSubfields < ActiveRecord::Migration[5.2]
  def change
    create_table :subfields do |t|

      t.timestamps
    end
  end
end
