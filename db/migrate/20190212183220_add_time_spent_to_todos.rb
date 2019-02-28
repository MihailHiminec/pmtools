class AddTimeSpentToTodos < ActiveRecord::Migration[5.2]
  def change
    add_column :todos, :time_spent, :integer
  end
end
