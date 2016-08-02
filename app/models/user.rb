class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable

  has_many :user_songs, dependent: :destroy
  has_many :songs, through: :user_songs

  enum role: [:guest, :logged, :admin]

  private
  def set_default_role
  	self.role ||= 1
  end
end
