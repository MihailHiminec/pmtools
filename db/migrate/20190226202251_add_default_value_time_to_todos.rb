class AddDefaultValueTimeToTodos < ActiveRecord::Migration[5.2]
  def change
    change_column_default :todos, :time_spent, from: '', to: '0'
    change_column_default :todos, :time_to_complete, from: '', to: '0'
  end
end
