class Team < ActiveRecord::Base
  has_many :favorite_teams
  has_many :users, through: :favorite_teams
  belongs_to :conference

  validates :name, presence: true
  validates :nickname, presence: true
  validates :conference, presence: true
  validates :league, presence: true
end
