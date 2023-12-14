module Types
  class ApartmentType < Types::BaseObject
    graphql_name 'Apartment'
    description 'An Apartment Type'
    field :id, ID
    field :room_type, String
    field :description, String
    field :resort_id, ID
  end
end
