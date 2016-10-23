class Conference < ActiveRecord::Base
  has_many :teams

  validates :name, presence: true

  CONFERENCES = Conference.all
end
