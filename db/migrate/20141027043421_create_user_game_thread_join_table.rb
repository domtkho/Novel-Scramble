class CreateUserGameThreadJoinTable < ActiveRecord::Migration
  def change
    create_join_table :users, :game_threads do |t|
      # t.index [:user_id, :game_thread_id]
      # t.index [:game_thread_id, :user_id]
    end
  end
end
