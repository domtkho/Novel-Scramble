class AddRoundToGameThreads < ActiveRecord::Migration
  def change
    add_column :game_threads, :round, :integer, default: 1
  end
end
