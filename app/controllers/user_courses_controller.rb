class UserCoursesController < ApplicationController
  before_filter :authorize

  before_action :set_user_course, only: [:delete]

  # GET /user_courses
  def index
    @courses = current_user.courses
  end
end
