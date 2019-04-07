class Contractor < ApplicationRecord
  validates :title, presence: true, length: { maximum: 50 }
  validates :inn, presence: true, length: { maximum: 10 }

  has_many :projects
  belongs_to :user
end