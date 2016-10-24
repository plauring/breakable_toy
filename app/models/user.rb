class User < ApplicationRecord
  has_many :memberships
  has_many :events, through: :memberships

  has_many :favorites
  has_many :teams, through: :favorites

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :username, uniqueness: true, presence: true
  validates :email, uniqueness: true, presence: true
  validates :password, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true

  def admin?
    role == 'admin'
  end
end
