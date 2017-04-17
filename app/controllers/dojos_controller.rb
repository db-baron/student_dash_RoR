class DojosController < ApplicationController
  def index
      @dojos = Dojo.all
  end

  def new
      render "dojos/new"
  end

  def show
      @dojo = Dojo.find(params[:id])
      @students = Student.all
  end

  def edit
      @dojo = Dojo.find(params[:id])
  end

  def create
    render json: params
    #   @dojo = Dojo.create( branch: params[:branch], street: params[:street], city: params[:city], state: params[:state])
    #   @dojo = Dojo.create(dojo_params)
    #   redirect_to "/dojos", notice: "You successully created a Dojo"
  end

  def update
      @dojo = Dojo.find(params[:id])
      # If you can run #dojo.update(dojo_params) then redirect to index page with a success message
      if @dojo.update(dojo_params)
          redirect_to "/dojos", notice: "You successully updated a Dojo"
      else
          flash[:errors] = @dojo.errors.full_messages
          redirect_to "/dojos", notice: "You failed updated a Dojo. Make sure you do not have any blank entries."
      end
      # A different way without using if statements
      # @dojo.find(params[:id]).update(dojo_params)
  end

  def destroy
      Dojo.find(params[:id]).destroy
    #   render json: params
      redirect_to "/dojos", notice: "You successully deleted a Dojo"
  end

  private
    def dojo_params
      params.require(:dojo).permit(:branch, :street, :city, :state)
    end

end
