class Parent < ActiveRecord::Base
  has_secure_password
  validates :name, :email, :password, presence: true
  validates :email, uniqueness: true
  has_one :student
  accepts_nested_attributes_for :student
end
