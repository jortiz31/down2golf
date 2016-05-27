class CreateMatches < ActiveRecord::Migration
  def change
    create_table :matches do |t|
      t.datetime :timeanddate
      t.string :title
      t.belongs_to :course, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
