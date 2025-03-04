class StudentsController < ApplicationController
  before_action :set_student, only: :show
  
  def index
    @students = Student.all
  end

  def show
    @student = set_student
    @status = @student.active
  end

  def edit
    @student = set_student
    @student.active = !(@student.active)
    @student.save
    redirect_to student_url(@student)
  end

  private

    def set_student
      @student = Student.find(params[:id])
    end
end