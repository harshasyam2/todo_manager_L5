class Todo < ActiveRecord::Base
  belongs_to :user

  def due_today?
    due_date == Date.today
  end

  def self.overdue
    all.where("due_date<? and completed=?", Date.today, false)
  end

  def self.due_today
    all.where("due_date=?", Date.today)
  end

  def self.due_later
    all.where("due_date>?", Date.today)
  end

  def self.completed
    all.where("completed=?", true)
  end

  def self.of_user(user)
    all.where("user_id=?", user.id)
  end

  def to_pleasant_string
    "#{id} #{todo_text} #{due_date} #{completed}"
  end
end
