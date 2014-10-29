class AddStartTimeToGameThread < ActiveRecord::Migration
  def change
    add_column :game_threads, :start_time, :datetime
  end
end
