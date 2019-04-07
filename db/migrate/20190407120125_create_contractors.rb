class CreateContractors < ActiveRecord::Migration[5.2]
  def change
    create_table :contractors do |t|
      t.string :title
      t.references :user, foreign_key: true

      t.string :address
      t.bigint :ogrn
      t.bigint :inn
      t.bigint :kpp
      t.string :description
      t.timestamps
    end
  end
end
