require 'spec_helper'

RSpec.describe PlansController, type: :controller do
  describe 'GET /plans' do
    it 'renders the plans index template' do
      get '/plans'

      expect(last_response).to be_ok
      expect(last_response.body).to eq("[]")
    end

    it 'assigns all plans to @plans' do
      plan1 = Plan.create(name: 'Plan 1', price: 2.5)
      plan2 = Plan.create(name: 'Plan 2', price: 2.5)

      get '/plans'

      expect(last_response).to be_ok
      expect(JSON.parse(last_response.body)).to match_array([
        {"id" => plan1.id, "name" => "Plan 1", "price" => "2.5"},
        {"id"=>plan2.id, "name"=>"Plan 2", "price"=>"2.5"},
      ])
    end
  end

  describe 'GET /plans/:id' do
    it 'renders the plans show template' do
      plan = Plan.create(name: 'Plan 1', price: 2.5)

      get "/plans/#{plan.id}"

      expect(last_response).to be_ok
      expect(JSON.parse(last_response.body)).to eq({
        "id" => plan.id, "name" => "Plan 1", "price" => "2.5"
      })
    end
  end

  describe 'POST /plans' do
    it 'creates a new plan' do
      post '/plans', {plan: { name: 'Plan 1', price: 2.5 }}, as: :json

      expect(last_response).to be_ok
      expect(JSON.parse(last_response.body)).to eq({
        "id" => Plan.last.id, "name" => "Plan 1", "price" => "2.5"
      })
    end
  end

  describe 'PUT /plans/:id' do
    it 'updates a plan' do
      plan = Plan.create(name: 'Plan 1', price: 2.5)

      put "/plans/#{plan.id}", {plan: { name: 'Plan 2', price: 2.5 }}, as: :json

      expect(last_response).to be_ok
      expect(JSON.parse(last_response.body)).to eq({
        "id" => plan.id, "name" => "Plan 2", "price" => "2.5"
      })
    end

    context "when plan doesn't exist" do
      it 'returns a 404' do
        put "/plans/1", {plan: { name: 'Plan 2', price: 2.5 }}, as: :json

        expect(last_response.status).to eq(404)
        expect(JSON.parse(last_response.body)).to eq({
          "message" => "Not found."
        })
      end
    end
  end

  describe 'DELETE /plans/:id' do
    it 'deletes a plan' do
      plan = Plan.create(name: 'Plan 1', price: 2.5)

      delete "/plans/#{plan.id}"

      expect(last_response).to be_ok
      expect(JSON.parse(last_response.body)).to eq({
        "message" => "A plan was deleted."
      })
    end

    context "when plan doesn't exist" do
      it 'returns a 404' do
        delete "/plans/1"

        expect(last_response.status).to eq(404)
        expect(JSON.parse(last_response.body)).to eq({
          "message" => "Not found."
        })
      end
    end
  end
end
