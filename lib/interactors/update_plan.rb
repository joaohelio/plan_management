module PlanManagement
  module Interactors
    class UpdatePlan
      attr_reader :plan_repo

      def initialize(plan_repo:)
        @plan_repo = plan_repo
      end

      def execute(id:, params:)
        plan_repo.update(id: id, params: params)
      end
    end
  end
end
