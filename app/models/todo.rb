class Todo < ApplicationRecord
  validates :title, presence: true, length: { maximum: 50 }

  belongs_to :project
  belongs_to :user

  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << column_names
      all.each do |todo|
        csv << todo.attributes.values_at(*column_names)
      end
    end
  end
end
