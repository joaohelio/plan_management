## run application
`alias dc-dev="docker-compose -f docker-compose.yml"`
`dc-dev up plan_management`

## run tests
`alias dc-test="docker-compose -f docker-compose.yml -f docker-compose.test.yml"`
`dc-test run plan_management rspec`

## Use Case
As a product manager, I identified the need to expand our plan management capabilities into a comprehensive plan management system. By doing so, we could offer a wider range of plan features and better cater to the needs of our customers.

## Proposal solution
Refactoring of the PlansController class into a module called PlanManagement, which exposes a set of methods that interact with the application's business logic through a set of Interactors.

The PlanManagement module provides five public methods:

- `find`: retrieves a plan with a specific ID
- `all`: retrieves all plans
- `create`: creates a new plan
- `update`: updates a plan with a specific ID and parameters
- `delete`: deletes a plan with a specific ID

These methods interact with the business logic through `Interactors` that encapsulate the required logic. Each Interactor is initialized with a plan_repo, which is responsible for interacting with the data storage layer.

The plan_repo method dynamically returns either a `JalebiRepository::Plan` or `ActiveRecord::PlanRepository` object based on whether the :plan_management feature is enabled or not, using the Flipper feature flagging library.

Overall, this change separates concerns and increases modularity by abstracting the application's business logic behind a set of Interactors, and makes the code more testable and extensible by decoupling it from the `Sinatra::Base` web framework.

## Previous implementation on controller
```ruby
class PlansController < Sinatra::Base
  get "/plans" do
    Plan.all
  end

  get "/plans/:id" do
    Plan.find(params[:id])
  end

  post "/plans" do
    @plan = Plan.new(params)

    @plan.save
  end

  put "/plans/:id" do
    @plan = Plan.find(params[:id])

    @plan.update(params)
  end

  delete "/plans/:id" do
    @plan = Plan.find(params[:id])
    @plan.destroy
  end
end
```
