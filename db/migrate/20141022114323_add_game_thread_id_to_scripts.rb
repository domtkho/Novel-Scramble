class AddGameThreadIdToScripts < ActiveRecord::Migration
  def change
    add_column :scripts, :game_thread_id, :Integer
  end
end
