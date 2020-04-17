class ChangeDueDateToBeDateInTodos < ActiveRecord::Migration[6.0]
  def change
    change_column :todos, :due_date, :date
  end
end
