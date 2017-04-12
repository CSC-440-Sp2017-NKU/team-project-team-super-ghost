class UserCoursesController < ApplicationController
  before_filter :authorize

  # GET /user_courses
  def index
    @courses = current_user.courses
  end
end
