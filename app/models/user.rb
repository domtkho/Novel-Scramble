class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :game_threads
  has_many :scripts

  mount_uploader :avatar, AvatarUploader

  validates :username,
  :uniqueness => {
    :case_sensitive => false
  }

end
