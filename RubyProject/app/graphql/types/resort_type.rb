module Types
  class ResortType < Types::BaseObject
    graphql_name 'Resort'
    description 'A Resort Type'
    field :id, ID
    field :name, String
    field :email, String
    field :description, String
    field :apartments, [ApartmentType] do
      argument :size,
               Int,
               default_value: 15
    end
    def apartments(size:)
      object.apartments.limit(size).order(id: :asc)
    end
  end
end