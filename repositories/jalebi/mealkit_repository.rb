module Repositories
  module Jalebi
    class MealkitRepository
      def initialize(client:)
        @client = client
      end

      def find(id)
        plan = client.find(id)
        plan && plan_entity(plan)
      end

      def all
        client.all.map {|data| plan_entity(data)}
      end

      def create(params)
        plan = client.save(params)

        if plan.valid?
          [:ok, plan_entity(plan)]
        else
          [:failure, plan.errors]
        end
      end

      def update(id:, params:)
        plan = client.update(id: id, params: params)

        if plan.valid?
          [:ok, plan_entity(plan)]
        else
          [:failure, plan.errors]
        end
      end

      def destroy(id)
        client.destroy(id)

        :ok
      end

      private

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
