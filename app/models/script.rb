class Script < ActiveRecord::Base
  belongs_to :game_thread :user
end
