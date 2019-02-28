class Project < ApplicationRecord
  validates :title, presence: true, length: { maximum: 50 }

  has_many :todos
  belongs_to :user
end
