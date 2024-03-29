module Model::Theme
  class Normal < Base
    # Constants
    # DIFFICULTIES = %w(easy normal hard)

    # Class Methods
    # class << self
      # https://stackoverflow.com/a/1354568
      # Returns a case statement for ordering by a particular set of strings
      # Note that the SQL is built by hand and therefore injection is possible,
      # however since we're declaring the priorities in a constant above it's
      # safe.
      # Will be deprecated in Rails 6.1
    #   def order_by_case
    #     ret = "CASE"
    #     DIFFICULTIES.each_with_index do |p, i|
    #       ret << " WHEN theme_type = '#{p}' THEN #{i}"
    #     end
    #     ret << " END"
    #   end
    # end

    # Validations
    # validates :theme_type, 
    #   inclusion: { in: DIFFICULTIES, message: "%{value} is not a valid difficulty" }

    # Scopes
    # default_scope { order(order_by_case) }
    
    # 난이도가 모든 테마에 들어감으로써 기존 코드의 필요성이 없어짐

    def set_theme_type
      theme_type = difficulty_str
    end
  end
end