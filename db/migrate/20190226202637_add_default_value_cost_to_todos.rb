class AddDefaultValueCostToTodos < ActiveRecord::Migration[5.2]
  def change
    change_column_default :todos, :cost, from: '', to: '0'
  end
end
