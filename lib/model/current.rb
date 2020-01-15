require 'active_support/core_ext/module'

module Model
  module Current
    thread_mattr_accessor :user
  end 
end