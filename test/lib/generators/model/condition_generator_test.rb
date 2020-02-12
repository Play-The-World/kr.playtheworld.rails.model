require 'test_helper'
require 'generators/condition/condition_generator'

module Model
  class ConditionGeneratorTest < Rails::Generators::TestCase
    tests ConditionGenerator
    destination Rails.root.join('tmp/generators')
    setup :prepare_destination

    # test "generator runs without errors" do
    #   assert_nothing_raised do
    #     run_generator ["arguments"]
    #   end
    # end
  end
end
