class Teacher < ActiveRecord::Base
  has_secure_password
  validates :name, :email, :password, presence: true
  validates :email, uniqueness: true
  has_many :students


  def update_with_password(teacher_params)
    current_password = teacher_params.delete(:current_password)

    if self.authenticate(current_password)
      self.update(user_params)
      true
    else
      self.errors.add(:current_password, current_password.blank? ? :blank : :invalid)
      false
    end
  end
end

end
