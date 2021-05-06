module Model::Achievement
  class Default < Base
    # Relations
    belongs_to :stackable, class_name: Model::Achievement::Stackable.to_s, optional: true

    def stackable?
      !!stackable
    end

    def achieved?(user = Model.current.user)
      !!users.find { |u| u == user }
    rescue
      false
    end
  end
end