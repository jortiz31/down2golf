class AddDefaultValueToPremium < ActiveRecord::Migration
  def up
    change_column :users, :premium, :boolean, :default => false
  end

  def down
    change_column :users, :premium, :boolean, :default => nil
  end
end
