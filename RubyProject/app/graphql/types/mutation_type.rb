module Types
  class MutationType < Types::BaseObject
    graphql_name 'Mutation'

    # TODO: remove me
    field :test_field, String, null: false,
      description: "An example field added by the generator"
    def test_field
      "Hello World"
    end

    field :createResort, ResortType do
      description 'Creates new Resort'
      argument :name, String
      argument :email, String
    end
    def createResort(name:, email:)
      new_resort = Resort.create(name: name, email: email)
      new_resort
    end

    field :createApartment, ApartmentType do
      description 'Creates new Resort'
      argument :room_type, String
      argument :description, String
      argument :resort_id, ID
    end
    def createApartment(room_type:, description:, resort_id:)
      new_apartment = Apartment.create(
        room_type: room_type, description: description, resort_id: resort_id)
      new_apartment
    end
  end
end
