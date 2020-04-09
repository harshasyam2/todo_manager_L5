class User < ActiveRecord::Base
  def to_display
    "#{id}. #{name}  #{email}  #{password}"
  end
end
