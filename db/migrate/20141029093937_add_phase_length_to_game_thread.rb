class AddPhaseLengthToGameThread < ActiveRecord::Migration
  def change
    add_column :game_threads, :preparation_phase_length, :integer, default: 30000
    add_column :game_threads, :writing_phase_length, :integer, default: 60000
    add_column :game_threads, :voting_phase_length, :integer, default: 60000
  end
end
