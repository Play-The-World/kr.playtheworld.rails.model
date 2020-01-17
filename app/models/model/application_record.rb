module Model
  class ApplicationRecord < ActiveRecord::Base
    self.abstract_class = true

    def self.repo
      Model::Repository::Base.new(self)
    end
    def repo; self.repo end
  end
end
