class CreateUsermatches < ActiveRecord::Migration
  def change
    create_table :usermatches do |t|
      t.belongs_to :user, index: true, foreign_key: true
      t.belongs_to :match, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
