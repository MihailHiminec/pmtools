class CreateTodos < ActiveRecord::Migration[5.2]
  def change
    create_table :todos do |t|
      t.string :title
      t.string :discription
      t.integer :user_id
      t.boolean :isCompleted
      t.references :project, foreign_key: true

      t.timestamps
    end
  end
end
