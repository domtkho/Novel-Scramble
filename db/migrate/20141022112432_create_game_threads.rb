class CreateGameThreads < ActiveRecord::Migration
  def change
    create_table :game_threads do |t|
      t.string :thread_name
      t.string :genre

      t.timestamps
    end
  end
end
