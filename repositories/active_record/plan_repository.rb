module Repositories
  module ActiveRecord
    class PlanRepository
      def find(id)
        plan = model.find(id)
        plan && plan_entity(plan)
      end

      def all
        model.all.map {|data| plan_entity(data)}
      end

      def create(params)
        plan = model.create(params)

        if plan.valid?
          [:ok, plan_entity(plan)]
        else
          [:failure, plan.errors]
        end
      end

      def update(id:, params:)
        plan = model.update(id, params)

        if plan.valid?
          [:ok, plan_entity(plan)]
        else
          [:failure, plan.errors]
        end
      end

      def destroy(id)
        model.destroy(id)

        :ok
      end

      private

      def model
        @model ||= Plan
      end

      def plan_entity(plan)
        # disclamer: dto coupled to entity
        # for this scope we
        # dont see an advantage
        # to have a separeted dto from
        # the entity
        Entities::Plan.new(
          id: plan.id,
          name: plan.name,
          price: plan.price,
        )
      end
    end
  end
end
