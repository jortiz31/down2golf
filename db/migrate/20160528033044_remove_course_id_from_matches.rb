class RemoveCourseIdFromMatches < ActiveRecord::Migration
  def change
    remove_column :matches, :course_id, :integer
  end
end
