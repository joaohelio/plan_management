module PlanManagement
  module Interactors
    class GetAllPlans
      attr_reader :plan_repo

      def initialize(plan_repo:)
        @plan_repo = plan_repo
      end

      def execute
        plan_repo.all
      end
    end
  end
end
