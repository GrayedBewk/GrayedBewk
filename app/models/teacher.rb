class Teacher < ActiveRecord::Base
  has_secure_password
  validates :name, :email, :password, presence: true
  validates :email, uniqueness: true
  has_many :students
  accepts_nested_attributes_for :students
end
