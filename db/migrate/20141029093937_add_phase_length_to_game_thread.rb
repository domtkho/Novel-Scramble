class AddPhaseLengthToGameThread < ActiveRecord::Migration
  def change
    add_column :game_threads, :phase_length, :integer, default: 120000
  end
end
