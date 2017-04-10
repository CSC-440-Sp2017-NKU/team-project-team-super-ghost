class CoursesController < ApplicationController
  before_filter :authorize

  before_action :set_course, only: [:show]

  # GET /courses
  def index
    #@courses = Course.all
    @courses = Course.includes(:users).where('users.id IS NULL').references(:users)
  end

  # GET /courses/1
  def show
    # Handled by before_action
  end

  private
  def set_course
    @course = Course.find(params[:id])
    @breadcrumbs = [
        Breadcrumb.new(@course.title, course_path(@course))
    ]
  end
end
