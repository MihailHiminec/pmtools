class Contact < ApplicationRecord
  validates :name, presence: true, length: { maximum: 50 }
  validates :surname, presence: true, length: { maximum: 50 }
  validates :patronymic, presence: true, length: { maximum: 50 }

  belongs_to :user
end
