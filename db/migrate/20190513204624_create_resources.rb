class CreateResources < ActiveRecord::Migration[5.2]
  def change
    create_table :resources do |t|
      t.string :website
      t.string :title
      t.string :url
      t.string :language_id
      t.string :subfield_id
      t.string :mentor_id
      t.boolean :read, default: false

      t.timestamps
    end
  end
end
