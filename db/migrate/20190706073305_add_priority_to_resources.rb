class AddPriorityToResources < ActiveRecord::Migration[5.2]
  def change
    add_column :resources, :priority, :boolean, default: false
  end
end
