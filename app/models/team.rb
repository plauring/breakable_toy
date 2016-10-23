class Team < ActiveRecord::Base
  has_many :favorites
  has_many :users, through: :favorites
  belongs_to :conference

  validates :name, presence: true
  validates :nickname, presence: true
  validates :conference, presence: true
  validates :league, presence: true

end
