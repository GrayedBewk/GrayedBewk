class Student < ActiveRecord::Base
  has_secure_password
  validates :name, :email, :password, presence: true
  validates :email, uniqueness: true
  has_many :parents
  has_many :grades
  belongs_to :teacher
  accepts_nested_attributes_for :parents, :grades, :teacher
end
