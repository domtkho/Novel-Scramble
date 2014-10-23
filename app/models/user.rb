class User < ActiveRecord::Base
  has_many :scripts
  has_many :threads
end
