require 'active_support/core_ext/module'

module Model
  module Current
    MODELS = %i(
      user
    )

    MODELS.each do |accessor|
      thread_mattr_accessor(accessor)
    end
  end 
end