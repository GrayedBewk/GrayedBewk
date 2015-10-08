class Student < ActiveRecord::Base
  has_one :teacher 
end
