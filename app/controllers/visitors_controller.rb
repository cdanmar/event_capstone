class VisitorsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @visitors = Visitor.all 
  end

  def show
    @visitor = Visitor.find(params[:id])
  end

  def new
    @visitor = Visitor.new
  end

  def create
    @visitor = Visitor.new(visitor_params)

    if @visitor.save
      redirect_to @visitor.id
    else
      render 'new'
    end
  end

  def edit
    @visitors = Visitor.find_by(id: params[:id])
  end

  def update

  end

  def destroy
    visitor = Visitor.find_by(id: params[:id])
    event.destroy
    flash[:success] = "Event deleted."
    redirect_to "/"
  end



private 
  def visitor_params
    params.require(:visitor).permit(:name, :email, :phone)
  end
end
