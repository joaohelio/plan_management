module PlanManagement
  module Interactors
    class DeletePlan
      attr_reader :plan_repo

      def initialize(plan_repo:)
        @plan_repo = plan_repo
      end

      def execute(id)
        plan_repo.destroy(id)
      end
    end
  end
end
