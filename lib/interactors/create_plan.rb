module PlanManagement
  module Interactors
    class CreatePlan
      attr_reader :plan_repo

      def initialize(plan_repo:)
        @plan_repo = plan_repo
      end

      def execute(params)
        plan_repo.create(params)
      end
    end
  end
end
