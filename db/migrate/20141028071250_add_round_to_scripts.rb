class AddRoundToScripts < ActiveRecord::Migration
  def change
    add_column :scripts, :round, :integer
  end
end
