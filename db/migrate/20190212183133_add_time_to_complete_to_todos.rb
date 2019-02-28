class AddTimeToCompleteToTodos < ActiveRecord::Migration[5.2]
  def change
    add_column :todos, :time_to_complete, :integer
  end
end
