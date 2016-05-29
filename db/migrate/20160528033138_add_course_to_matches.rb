class AddCourseToMatches < ActiveRecord::Migration
  def change
    add_reference :matches, :course, index: true, foreign_key: true
  end
end
