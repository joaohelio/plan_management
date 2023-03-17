module PlanManagement
  def self.find(id)
    Interactors::FindPlan.new(
      plan_repo: plan_repo,
    ).call(id)
  end

  def self.all
    Interactors::GetAllPlans.new(
      plan_repo: plan_repo,
    ).call()
  end

  def self.create(params)
    Interactors::CreatePlan.new(
      plan_repo: plan_repo,
    ).call(params)
  end

  def self.update(id:, params:)
    Interactors::UpdatePlan.new(
      plan_repo: plan_repo,
    ).call(id: id, params: params)
  end

  def self.plan_repo
    if Flipper.enabled?(:plan_management)
      Repositories::JalebiRepository::Plan.new(
        client: Ports::PlanManagementClient.new,
      )
    else
      Repositories::ActiveRecordRepository::Plan.new
    end
  end
end
