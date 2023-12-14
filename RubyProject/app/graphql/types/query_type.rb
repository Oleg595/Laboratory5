module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    # include GraphQL::Types::Relay::HasNodeField
    # include GraphQL::Types::Relay::HasNodesField

    graphql_name "Query"
    description 'The query root for TimeshareSchema'
    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    # TODO: remove me
    field :test_field, String, null: false,
      description: "An example field added by the generator"
    def test_field
      "Hello World!"
    end

    field :all_resorts, [ResortType] do
      description 'All Resorts everywhere'
      argument :size,   Int,
               default_value: 15
    end
    def all_resorts(size:)
      Resort.all.limit(size).order(id: :asc)
    end

    # One resort
    field :resort, ResortType do
      argument :id, ID, required: true
      description 'One Resort by its ID'
    end
    def resort(id:)
      Resort.find(id)
    end

    # All apartments
    field :all_apartments, [ApartmentType] do
      description 'All Apartment everywhere'
      argument :size,
               Int,
               default_value: 15
    end
    def all_apartments(size:)
      Apartment.all.limit(size).order(id: :asc)
    end

    # One apartment
    field :apartment, ApartmentType do
      argument :id, ID
      description 'One Apartment by its ID'
    end
    def apartment(id:)
      Apartment.find(id)
    end
  end
end
