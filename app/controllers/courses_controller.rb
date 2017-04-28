class CoursesController < ApplicationController
 
  before_filter :authorize
  before_filter :redirect_if_not_r_or_a, :except => [:index, :show]
  before_filter :redirect_if_registrar, :except => [:create, :new]

  

  before_action :set_course, only: [:show]

  def new
    @course = Course.new
  end

  # GET /courses
  def index
    #@courses = Course.all
    if current_user.courses.exists?
      user_course_ids = current_user.courses.pluck(:id)
      @courses = Course.all.where('id NOT IN(?)', user_course_ids)
    else
      @courses = Course.all
    end
  end
  
  def create
    @course = Course.new(course_params)
    if @course.save
      redirect_to root_path
    else
      render :new
    end
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
