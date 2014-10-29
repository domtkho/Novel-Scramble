class AddMinWriterToGameThread < ActiveRecord::Migration
  def change
    add_column :game_threads, :min_writer, :integer, default: 4
  end
end
