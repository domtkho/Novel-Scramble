class AddMaxWriterToGameThread < ActiveRecord::Migration
  def change
    add_column :game_threads, :max_writer, :integer, default: 8
  end
end
