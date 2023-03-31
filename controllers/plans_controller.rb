class PlansController < Sinatra::Base
  before do
    content_type :json
  end
  
  get "/plans" do
    PlanManagement.all.to_json
  end

  get "/plans/:id" do
    PlanManagement.find(params['id']).to_json
  end

  post "/plans" do
    ok, response = PlanManagement.create(params['plan'])

    status 400 unless ok == :ok

    response.to_json
  end

  put "/plans/:id" do
    ok, response = PlanManagement.update(id: params['id'], params: params['plan'])

    status 400 unless ok == :ok

    response.to_json

  rescue ActiveRecord::RecordNotFound => _e
    status 404
    { message: 'Not found.' }.to_json
  end

  delete "/plans/:id" do
    PlanManagement.delete(params[:id])

    { message: "A plan was deleted."}.to_json
  rescue ActiveRecord::RecordNotFound => _e
    status 404
    { message: 'Not found.' }.to_json
  end
end
