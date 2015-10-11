class SessionsController < ApplicationController
  def new
  end

  # def create
  #   render 'new'
  # end

  def create
    # Search for user in databases. One of these will fill with information, the other two will be nil.
    t = Teacher.find_by_email(params[:email])
    s = Student.find_by_email(params[:email])
    p = Parent.find_by_email(params[:email])
    # Check the above variables to see which user type we are dealing with and then populate session variables.
    if t && t.authenticate(params[:password])
      session[:login] = true
      session[:name] = t.name
      session[:user_type] = t.class.to_s
      session[:user_id] = t.id
      redirect_to teachers_path, notice: "You have been successfully logged in."
    elsif s && s.authenticate(params[:password])
      session[:login] = true
      session[:name] = s.name
      session[:user_type] = s.class.to_s
      session[:user_id] = s.id
      redirect_to students_path, notice: "You have been successfully logged in."
    elsif p && p.authenticate(params[:password])
      session[:login] = true
      session[:name] = p.name
      session[:user_type] = p.class.to_s
      session[:user_id] = p.id
      redirect_to parents_path, notice: "You have been successfully logged in."
    else
      # If user is not found, redirect to login page.
      # redirect_to login_path, notice: "Email/password incorrect.  Please try again or create a new account."
      flash[:notice] = 'Invalid email/password combination' # Not quite right!
      render 'new'
    end
  end

  # def index
  #   # Search for user in databases. One of these will fill with information, the other two will be nil.
  #   t = Teacher.find_by(email: params[:session][:email])
  #   s = Student.find_by(email: params[:session][:email])
  #   p = Parent.find_by(email: params[:session][:email])
  #   # Check the above variables to see which user type we are dealing with and then populate session variables.
  #   if t && t.authenticate(params[:session][:password])
  #     session[:login] = true
  #     session[:name] = t.name
  #     session[:user_type] = t.class.to_s
  #     session[:teacher_id] = t.id
  #     redirect_to root_path, notice: "You have been successfully logged in."
  #   elsif s && s.authenticate(params[:session][:password])
  #     session[:login] = true
  #     session[:name] = s.name
  #     session[:user_type] = s.class.to_s
  #     session[:student_id] = t.id
  #     redirect_to root_path, notice: "You have been successfully logged in."
  #   elsif p && p.authenticate(params[:session][:password])
  #     session[:login] = true
  #     session[:name] = p.name
  #     session[:user_type] = p.class.to_s
  #     session[:parent_id] = t.id
  #     redirect_to root_path, notice: "You have been successfully logged in."
  #   else
  #     # If user is not found, redirect to login page.
  #     redirect_to login_path, notice: "Email/password incorrect.  Please try again or create a new account."
  #   end
  # end

  def destroy
    session[:login] = false
    session[:name] = nil
    session[:user_type] = nil
    session[:user_id] = nil
    redirect_to root_path, notice: "You have successfully logged out"
  end

  def index
  end

  private

    def set_params
      params.require(:session).permit(:name, :email, :password)
    end
end
