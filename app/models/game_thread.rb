class GameThread < ActiveRecord::Base
  belongs_to :user
  has_many :scripts
end
