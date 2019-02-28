class AddDefaultValueToTodos < ActiveRecord::Migration[5.2]
  def change
    change_column_default :todos, :isCompleted, from: true, to: false
  end
end
