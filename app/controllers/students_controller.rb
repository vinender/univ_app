class StudentsController < ApplicationController
	skip_before_action :require_user, only: [:new, :create]
	before_action :set_student, only: [:show, :edit, :update]
	before_action :require_same_student, only: [:edit, :update]

	def new
		@student = Student.new

	end 

	def index
		@students = Student.all 

	end

	def show 
    # set_student method
	end 

	def create
		@student = Student.new(student_params)
		if @student.save
			flash[:notice] = "You have successfully signed up"
			redirect_to @student
		else 
			render 'new'
		end
	end 

	def edit 
	 # set_student method

	end 

	def update
		  # set_student method
		 if @student.update(student_params)
			flash[:notice] = "Your profile is successfully updated"
			redirect_to @student #or student_path(@student)
		else 
			render 'edit'
		end


	end 

	private

	def set_student
	  @student = Student.find(params[:id])

	end 


	def student_params 
		params.require(:student).permit(:name, :email, :password, :password_confirmation)
	end 
	
	def require_same_student
		if current_user != @student
			flash[:notice] = "You can only edit your own profile"
			redirect_to student_path(current_user)
		end 
	end 

end 