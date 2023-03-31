module PlanManagement
  module Interactors
    class FindPlan
      attr_reader :plan_repo

      def initialize(plan_repo:)
        @plan_repo = plan_repo
      end

      def execute(id)
        plan_repo.find(id)
      end
    end
  end
end
