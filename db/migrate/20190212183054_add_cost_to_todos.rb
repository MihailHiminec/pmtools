class AddCostToTodos < ActiveRecord::Migration[5.2]
  def change
    add_column :todos, :cost, :integer
  end
end
