class Project < ApplicationRecord
  validates :title, presence: true, length: { maximum: 50 }

  has_many :todos
  has_many :payments
  belongs_to :user
  belongs_to :contractor

end
