class User < ActiveRecord::Base
  has_many :todos
  has_secure_password

  def to_display
    "#{id}. #{name}  #{email}  #{password}"
  end
end
