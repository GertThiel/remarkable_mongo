# Load Remarkable
unless Object.const_defined?('Remarkable')
  begin
    require 'remarkable'
  rescue LoadError
    require 'rubygems'
    gem 'remarkable'
    require 'remarkable'
  end
end
 
# Add locale
dir = File.dirname(__FILE__)
Remarkable.add_locale File.join(dir, '..', '..', 'locales', 'en.yml')

require File.join(dir, 'mongo_mapper', 'base')
require File.join(dir, 'mongo_mapper', 'describe')
# require File.join(dir, 'remarkable_mongomapper', 'human_names')

# Add matchers
Dir[File.join(dir, 'mongo_mapper', 'matchers', '*.rb')].each do |file|
  require file
end

# Include Remarkable MongoMapper matcher in appropriate ExampleGroup
if defined?(Spec::Rails)
  require File.join(dir, '..', 'spec', 'rails', 'example', 'mongo_mapper_example_group')
  Remarkable.include_matchers!(Remarkable::MongoMapper, Spec::Rails::Example::MongoMapperExampleGroup)
else
  Remarkable.include_matchers!(Remarkable::MongoMapper, Spec::Example::ExampleGroup)
end