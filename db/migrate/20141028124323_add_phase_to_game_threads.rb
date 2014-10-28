class AddPhaseToGameThreads < ActiveRecord::Migration
  def change
    add_column :game_threads, :phase, :string
  end
end
