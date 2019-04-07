class AddContractorRefToPayments < ActiveRecord::Migration[5.2]
  def change
    add_reference :payments, :contractor, foreign_key: true
  end
end
