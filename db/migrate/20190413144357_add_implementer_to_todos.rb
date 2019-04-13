class AddImplementerToTodos < ActiveRecord::Migration[5.2]
  def change
    add_column :todos, :implementer, :integer
  end
end
