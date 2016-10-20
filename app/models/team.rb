class Team < ActiveRecord::Base

  validates :name, presence: true
  validates :nickname, presence: true
  validates :conference, presence: true
  validates :league, presence: true
end
