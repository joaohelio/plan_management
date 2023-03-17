class PlansController < ApplicationController
  def index
    render json: PlanManagement.all
  end

  def show
    render json: PlanManagement.find(params[:id])
  end

  def create
    status, response = PlanManagement.create(plan_params)

    if status == :ok
      render json: response
    else
      render json: response, status: 400
    end
  end

  def update
    status, response = PlanManagement.update(id: params[:id], params: plan_params)

    if status == :ok
      render json: response
    else
      render json: response, status: 400
    end
  end

  def destroy
    status, _response = PlanManagement.delete(id: params[:id])

    if status == :ok
      render json: { message: "A plan was deleted."}
    else
      render json: { message: "something went wrong." }, status: 400
    end
  end

  private

  def plan_params
    params.require(:plan).permit(:name, :description, :price)
  end
end
