module Model::Achievement
  class Stackable < Base
    # Relations
    has_many :achievements, class_name: Model::Achievement::Default.to_s, foreign_key: 'stackable_id'
    
  end
end