class AddTodosPriority < ActiveRecord::Migration[5.2]
  def change
    add_column :todos, :priority, :integer, default: '0'
  end
end
