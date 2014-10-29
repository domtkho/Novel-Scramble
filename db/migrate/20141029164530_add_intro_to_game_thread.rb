class AddIntroToGameThread < ActiveRecord::Migration
  def change
    add_column :game_threads, :intro, :text
  end
end
