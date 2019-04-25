class CreateContacts < ActiveRecord::Migration[5.2]
  def change
    create_table :contacts do |t|
      t.string :name
      t.string :patronymic
      t.string :surname
      t.string :email
      t.string :phone
      t.date :birthday
      t.string :comment
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
