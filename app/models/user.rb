class User < ApplicationRecord
  devise :database_authenticatable, :recoverable, :rememberable, :validatable, :invitable

  validates :name, presence: true
  has_many :projects
  has_many :payments
  has_many :contractors
end
