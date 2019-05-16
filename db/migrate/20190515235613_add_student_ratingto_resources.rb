class AddStudentRatingtoResources < ActiveRecord::Migration[5.2]
  def change
    add_column :resources, :student_rating, :integer 
  end
end
