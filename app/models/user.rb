class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_and_belongs_to_many :game_threads
  has_many :scripts

  mount_uploader :avatar, AvatarUploader

  validates :username,
  :uniqueness => {
    :case_sensitive => false
  }

  # acts_as_voter

end
