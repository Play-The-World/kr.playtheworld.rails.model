module Model::Serializer
  class ClueInInventory < Base
    view :base do
      fields :clue_id, :inventory_id, :shared
      
      # Relations
      # association :images, blueprint: Image
    end

    view :play do
      include_view :base

      association :clue, blueprint: Clue, view: :play
    end

    view :making do
      include_view :base
      # association :branches, blueprint: Branch, view: :making
    end
  end
end