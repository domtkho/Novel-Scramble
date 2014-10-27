class Script < ActiveRecord::Base
  belongs_to :game_thread
  belongs_to :user

  acts_as_votable
end
