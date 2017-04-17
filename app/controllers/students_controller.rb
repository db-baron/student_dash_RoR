class StudentsController < ApplicationController

    def new
    #   render json: params
      @dojos = Dojo.all
      @dojo = Dojo.find(params[:dojo_id])
    end

    def show
    #   render json: @student
    #   render json: params


      # Use the student.rb models file method 'with_dojo'
      @student = Student.with_dojo(params[:student_id])
      # Use the student.rb models file method 'cohort'
      @cohort = Student.cohort(@student)

    end

    def edit
      @dojos = Dojo.find(params[:dojo_id])
      @student = Student.find(params[:student_id])
    end

    def create
      @student = Student.create(student_params)
      redirect_to "/dojos/#{params[:dojo_id]}"
    end

    def update
      @student = Student.find(params[:student_id])
      @student.update(student_params)
      redirect_to "/dojos/#{params[:dojo_id]}"
    end

    def destroy
      Student.find(params[:student_id]).destroy
      redirect_to "/dojos/#{params[:dojo_id]}"
    end

    # Whitelisting prevents a user from mannually entering a route that's private, like :bank_account
    private
      def student_params
        params.require(:student).permit(:first_name, :last_name, :email, :dojo_id)
      end

end
