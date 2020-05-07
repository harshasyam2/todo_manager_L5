class User < ActiveRecord::Base
  validates :first_name, presence: true
  validates :email, presence: true
  validates :email, presence: true
  has_many :todos
  has_secure_password

  def to_display
    "#{id}. #{name}  #{email}  #{password}"
  end
end
