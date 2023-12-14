class RubyProjectSchema < GraphQL::Schema
  # mutation(Types::MutationType)
  query Types::QueryType
  mutation Types::MutationType

  # For batch-loading (see https://graphql-ruby.org/dataloader/overview.html)
  use GraphQL::Dataloader
end
