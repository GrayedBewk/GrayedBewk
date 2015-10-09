class SessionController < ApplicationController
  def new
  end

  def create
    teacher = Teacher.create()
  end

  def destroy
  end
end
