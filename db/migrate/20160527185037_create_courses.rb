class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :location
      t.string :image
      t.string :name
      t.string :url
      t.integer :price

      t.timestamps null: false
    end
  end
end
