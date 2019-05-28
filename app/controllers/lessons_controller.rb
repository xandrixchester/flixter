class LessonsController < ApplicationController
	before_action :authenticate_user!
	before_action :require_authorized_for_current_lesson, only: [:show]

	def new
		@lesson = Lesson.new
	end
	
	def create
	end


	def show
	end


	

private


	def require_authorized_for_current_lesson
		if current_lesson.section.course.user != current_user
			redirect_to course_path, alert: 'You are not enrolled in this course'
		end
	end

  helper_method :current_lesson

  def current_lesson
    @current_lesson ||= Lesson.find(params[:id])
  end


end
