class Team < ActiveRecord::Base
  has_many :favorites
  has_many :users, through: :favorites
  has_many :home_games, :class_name => 'Game', :foreign_key => 'home_team_id'
  has_many :away_games, :class_name => 'Game', :foreign_key => 'away_team_id'
  belongs_to :conference

  validates :name, presence: true
  validates :nickname, presence: true
  validates :conference, presence: true
  validates :league, presence: true
  validates :key, presence: true

  def schedule
    Game.where('home_team_id = ? or away_team_id = ?', id, id)
  end

  def full_name
    "#{name} #{nickname}"
  end

end
