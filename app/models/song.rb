class Song < ActiveRecord::Base
	has_many :user_songs, dependent: :destroy
	has_many :users, through: :user_songs
	has_many :genres
end
