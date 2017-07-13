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
      redirect_to "/visitors/#{@visitor.id}"
    else
      render 'new'
    end
  end

  def edit
    @visitor = Visitor.find_by(id: params[:id])
  end

  def update
    visitor = Visitor.find_by(id: params[:id])
    visitor.assign_attributes(name: params[:name], email: params[:email], phone: params[:phone], identifier_key: params[:identifier_key])
    visitor.save
    flash[:success] = "Event Updated"
    redirect_to "/visitors/#{visitor.id}"

  end

  def destroy
    visitor = Visitor.find_by(id: params[:id])
    visitor.destroy
    flash[:success] = "Visitor deleted."
    redirect_to "/visitors"
  end



private 
  def visitor_params
    params.require(:visitor).permit(:name, :email, :phone, :identifier_key)
  end
end
