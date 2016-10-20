class Event < ActiveRecord::Base
  has_many :memberships
  has_many :users, through: :memberships

  validates :name,       presence: true
  validates :description, presence: true
  validates :location,   presence: true
  validates :address,    presence: true
  validates :city,      presence: true
  validates :state,     presence: true
  validates :zip,       presence: true
end
