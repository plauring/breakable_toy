class Event < ActiveRecord::Base
  has_many :memberships
  has_many :users, through: :memberships
  belongs_to :game

  validates :name,       presence: true
  validates :description, presence: true
  validates :location,   presence: true
  validates :address,    presence: true
  validates :city,      presence: true
  validates :state,     presence: true
  validates :zip,       presence: true

  def full_address
    "#{address} #{city}, #{state} #{zip}"
  end
end
