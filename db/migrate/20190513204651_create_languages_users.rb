class CreateLanguagesUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :languages_users do |t|
      t.integer :language_id
      t.integer :user_id

      t.timestamps
    end
  end
end
