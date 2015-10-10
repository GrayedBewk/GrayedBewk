class Student < ActiveRecord::Base
  has_one :teacher
  has_many :parents
  has_many :grades
end
