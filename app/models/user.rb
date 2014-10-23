class User < ActiveRecord::Base
  has_many :scripts :threads
end
