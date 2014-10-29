class AddRoundStartTimeToGameThreads < ActiveRecord::Migration
  def change
    add_column :game_threads, :round_end_time, :datetime
  end
end
