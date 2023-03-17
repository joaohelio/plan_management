class PlansController < ApplicationController
  def index
    Plan.all
  end

  def show
    Plan.find(params[:id])
  end

  def create
    @plan = Plan.new(plan_params)

    @plan.save
  end

  def update
    @plan = Plan.find(params[:id])

    @plan.update(plan_params)
  end

  def destroy
    @plan = Plan.find(params[:id])
    @plan.destroy
  end

  private

  def plan_params
    params.require(:plan).permit(:name, :description, :price)
  end
end
