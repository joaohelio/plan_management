require '/app/repositories/active_record/plan_repository'
require '/app/repositories/jalebi/mealkit_repository'

require '/app/lib/interactors/create_plan'
require '/app/lib/interactors/find_plan'
require '/app/lib/interactors/get_all_plans'
require '/app/lib/interactors/update_plan'
require '/app/lib/interactors/delete_plan'

module PlanManagement
  def self.find(id)
    Interactors::FindPlan.new(
      plan_repo: plan_repo,
    ).execute(id)
  end

  def self.all
    Interactors::GetAllPlans.new(
      plan_repo: plan_repo,
    ).execute()
  end

  def self.create(params)
    Interactors::CreatePlan.new(
      plan_repo: plan_repo,
    ).execute(params)
  end

  def self.update(id:, params:)
    Interactors::UpdatePlan.new(
      plan_repo: plan_repo,
    ).execute(id: id, params: params)
  end

  def self.delete(id)
    Interactors::DeletePlan.new(
      plan_repo: plan_repo,
    ).execute( id)
  end

  def self.plan_repo
    # if Flipper.enabled?(:plan_management)
    # Repositories::JalebiRepository::Plan.new(
    #   client: Ports::PlanManagementClient.new,
    # )
    # else
    Repositories::ActiveRecord::PlanRepository.new
    # end
  end
end
