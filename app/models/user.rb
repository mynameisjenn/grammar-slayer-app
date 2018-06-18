class User < ApplicationRecord
  validates :username, :name, :city, :state, presence: true
  validates :mini_bio, length: { maximum: 255 }

  has_many :game_plays
end