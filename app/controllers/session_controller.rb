class SessionController < ApplicationController
  def new
  end

  def create
    # Log the techer in and redirect to the teacher's show page.
    t = Teacher.find_by(email: params[:session][:email])
    s = Student.find_by(email: params[:session][:email])
    p = Parent.find_by(email: params[:session][:email])
    if t && t.authenticate(params[:session][:password])
      session[:login] = true
      session[:name] = t.name
      session[:user_type] = t.class.to_s
      session[:teacher_id] = t.id
      redirect_to teachers_path, notice: "You have been successfully logged in."
    elsif s && s.authenticate(params[:session][:password])
      session[:login] = true
      session[:name] = s.name
      session[:user_type] = s.class.to_s
      session[:student_id] = t.id
      redirect_to students_path, notice: "You have been successfully logged in."
    elsif p && p.authenticate(params[:session][:password])
      session[:login] = true
      session[:name] = p.name
      session[:user_type] = p.class.to_s
      session[:parent_id] = t.id
      redirect_to parents_path, notice: "You have been successfully logged in."
    else
      redirect_to 
    end
  end

  def index
  end

  def destroy
  end

  def index
  end
end
