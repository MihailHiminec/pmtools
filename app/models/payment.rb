class Payment < ApplicationRecord
  validates :invoice_number, presence: true, length: { maximum: 8 }

  belongs_to :project
  belongs_to :user
  belongs_to :contractor

  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << column_names
      all.each do |payment|
        csv << payment.attributes.values_at(*column_names)
      end
    end
  end
end
