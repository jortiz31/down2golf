class Removetimeanddatefrommatch < ActiveRecord::Migration
  def change
    remove_column :matches, :timeanddate, :datetime
    add_column :matches, :date, :datetime
    add_column :matches, :time, :datetime
  end
end
