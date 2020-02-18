module Model
  module Seeder
    module Main
      class Base
        def test
          puts "Testing..."
          errors = []
          # TestCode
          puts "Done."
          return errors
        end
      
        def seed
          # Seed into DB
          puts "Seeding..."
          
          puts "Done."
        end
      end
    end
  end
end