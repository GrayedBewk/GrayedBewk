class SessionController < ApplicationController
  def new
  end

  def create
    # Log the techer in and redirect to the teacher's show page.
    t = Teacher.find_by(email: params[:session][:email])
    s = Student.find_by(email: params[:session][:email])
    p = Parent.find_by(email: params[:session][:email])
    if t && t.authenticate(params[:session][:password])
      redirect_to teachers_path, notice: "You have been successfully logged in."
    elsif s && s.authenticate(params[:session][:password])
      redirect_to grades_path, notice: "You have been successfully logged in."
    elsif p && p.authenticate(params[:session][:password])
      redirect_to grades_path, notice: "You have been successfully logged in."
    else
      flash[:danger] = 'Invalid email/password combination' # Not quite right!
      render 'new'
    end
  end

  def index
  end

  def destroy
  end
end
