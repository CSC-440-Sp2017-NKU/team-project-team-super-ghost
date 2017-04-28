class UserCoursesController < ApplicationController
  before_filter :authorize
  before_filter :redirect_if_registrar

  # GET /user_courses
  def index
    @courses = current_user.courses
  end
end
