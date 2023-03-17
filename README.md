## Background
Migrate the plan management from a legacy system to an external service

## Use Case
plans table has an association with
`user_plans table` and we want to migrate the `plan management`
to a microservice in order to have more flexibility to scale the application

## Proposal solution:
1. Separate the domain from the Rails Framework
2. Decouple the Plan Entity from the Rails model
3. Create a repository for the current plan model
4. Create a repository for the external service
5. Gradually switch the traffic to the new service using Flipper.

## V1
Monolith application

## V2
Decoupled domain logic from the framework
