module Entities
  class Plan < Dry::Struct
    attribute :id, DryTypes::Strict::Integer
    attribute :name, DryTypes::Strict::String
    attribute :price, DryTypes::Strict::Decimal

    # PUT THE CRITICAL BUSINESS RULES HERE
  end
end
