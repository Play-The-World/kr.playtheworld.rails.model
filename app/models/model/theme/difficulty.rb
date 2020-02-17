module Model::Theme
  class Difficulty < Base
    # Constants
    DIFFICULTIES = %w(easy normal hard)

    # Class Methods
    class << self
      # https://stackoverflow.com/a/1354568
      # Returns a case statement for ordering by a particular set of strings
      # Note that the SQL is built by hand and therefore injection is possible,
      # however since we're declaring the priorities in a constant above it's
      # safe.
      # Will be deprecated in Rails 6.1
      def order_by_case
        ret = "CASE"
        DIFFICULTIES.each_with_index do |p, i|
          ret << " WHEN theme_type = '#{p}' THEN #{i}"
        end
        ret << " END"
      end
    end

    # Validations
    validates :theme_type, 
      inclusion: { in: DIFFICULTIES, message: "%{value} is not a valid difficulty" }

    # Scopes
    default_scope { order(order_by_case) }
    
  end
end