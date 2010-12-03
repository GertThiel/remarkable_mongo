module Spec
  module Rails
    module Example
      # MongoMapper model examples live in `$RAILS_ROOT/spec/mm_models/`.
      #
      # Model examples use Spec::Rails::Example::MongoMapperExampleGroup,
      # which provides support for fixtures and some custom expectations
      # via extensions to ActiveRecord::Base.
      base = defined?(ActiveRecord::TestCase) ? ActiveRecord::TestCase : ActiveSupport::TestCase
      class MongoMapperExampleGroup < base
        Spec::Example::ExampleGroupFactory.register(:mm_model, self)
      end
    end
  end
end
