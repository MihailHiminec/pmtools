class CreatePayments < ActiveRecord::Migration[5.2]
  def change
    create_table :payments do |t|
      t.string :invoice_number
      t.string :invoice_discription
      t.integer :user_id
      t.boolean :is_completed, default: false
      t.references :project, foreign_key: true
      t.integer :cost
      t.datetime :plan_date_payment
      t.datetime :rel_date_payment

      t.timestamps
    end
  end
end
