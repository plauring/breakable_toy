class User < ApplicationRecord
  has_many :registrations
  has_many :events, through: :registrations
  
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
