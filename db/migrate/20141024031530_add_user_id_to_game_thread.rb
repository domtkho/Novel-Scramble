class AddUserIdToGameThread < ActiveRecord::Migration
  def change
    add_column :game_threads, :user_id, :integer
  end
end
