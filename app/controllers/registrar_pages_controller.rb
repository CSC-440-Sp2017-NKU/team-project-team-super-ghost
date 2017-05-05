class RegistrarPagesController < ApplicationController
  before_filter :authorize
  before_filter :redirect_if_student_or_teacher
  def home
  end

  def add_student_to_course
  end

  def post_add_student_to_course
    user = User.find(post_params[:user_id])
    course = Course.find(post_params[:course_id])
    user.courses << course
    redirect_to add_student_to_course_path
  end

  def post_params
    params.permit(:user_id, :course_id)
  end
end