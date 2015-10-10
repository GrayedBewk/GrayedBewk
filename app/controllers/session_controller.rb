class SessionController < ApplicationController
  def new
  end

  def create
    if request.post?
      t = Teacher.find_by_email(params[:email])
      s = Student.find_by_email(params[:email])
      p = Parent.find_by_email(params[:email])
      if t && t.authenticate(params[:password])
        session[:login] = true
        session[:name] = t.name
        session[:user_type] = t.class.to_s
        session[:teacher_id] = t.id
        redirect_to root_path, notice: "You have successfully logged in."
      elsif s && s.authenticate(params[:password])
        session[:login] = true
        session[:name] = s.name
        session[:user_type] = s.class.to_s
        session[:student_id] = t.id
        redirect_to root_path, notice: "You have successfully logged in."
      elsif p && p.authenticate(params[:password])
        session[:login] = true
        session[:name] = p.name
        session[:user_type] = p.class.to_s
        session[:parent_id] = t.id
        redirect_to root_path, notice: "You have successfully logged in."
      else
        redirect_to login_path, notice: "E-mail or password incorrect. Please try again." if session[:login]
      end
    end
  end

  def destroy
  end

  def index
  end
end
