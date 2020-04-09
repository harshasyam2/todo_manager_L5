class TodosController < ApplicationController
  def index
    render plain: Todo.all.map { |todo| todo.to_pleasant_string }
  end

  def show
    id = params[:id]
    todo = Todo.find(id)
    render plain: todo.to_pleasant_string
  end

  def create
    todo_text = params[:todo_text]
    due_date = params[:due_date]
    completed = params[:completed]
    new_todo = Todo.create!(todo_text: todo_text, due_date: due_date, completed: completed)
    render plain: new_todo.to_pleasant_string
  end
end
