require 'dry-struct'

module Types
  include Dry.Types()
end

module Entities
  class Plan < Dry::Struct
    transform_keys(&:to_sym)

    attribute :id, Types::Strict::Integer
    attribute :name, Types::Strict::String
    attribute :price, Types::Strict::Decimal

    # PUT THE CRITICAL BUSINESS RULES HERE
  end
end
