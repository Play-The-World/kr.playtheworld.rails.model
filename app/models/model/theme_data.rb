module Model
  class ThemeData < ApplicationRecord
    # Relations
    belongs_to :theme, class_name: Model.config.theme.class_name
    has_many :stage_lists, class_name: Model.config.stage_list.class_name, dependent: :destroy
    has_many :stages, through: :stage_lists
    has_many :items, dependent: :destroy
    has_many :plays, dependent: :destroy, class_name: Model.config.play.class_name
    # has_many :super_plays, dependent: :destroy, counter_cache: true, foreign_key: "theme_data_id"
    include Model::Eventable
    include Model::EventTarget
    include Model::Musicable
    has_many :finished_plays, dependent: :destroy, class_name: Model::Play::Finished.to_s
    has_many :ranks, through: :finished_plays
    has_many :character_in_themes, dependent: :destroy
    has_many :clue_in_themes, dependent: :destroy
    has_many :game_rooms, dependent: :destroy
    include Model::Infoable

    # Callbacks
    before_create :set_version

    # Delegation
    delegate :title,
             :online?,
             :super_theme,
             :content, :caution, :caution_bold, :start_address, :start_position, :additional_text,
             to: :theme

    def characters
      (super_theme.characters.select { |c| c.default } +
        character_in_themes.map { |c| c.character }).uniq
    end

    def pickable_characters
      characters.select { |c| c.pickable? }
    end

    def clues
      (super_theme.clues.select { |c| c.default } +
        clue_in_themes.map { |c| c.clue }).uniq
    end

    def test
      Model::Stage.joins(stage_list: :theme_data).includes(:translations).where("#{Model::ThemeData.table_name}": { id: 1 } )
    end

    def start_stage_list
      # stage_lists.find_by(number: start_stage_list_number) || stages_lists.first
      stage_lists.find { |sl| sl.number == start_stage_list_number } || stage_lists.first
    end

    def current_play_by(user)
      return nil if user.nil?

      plays
        .select { |p|
          p.user == user and
            p.type == Model::Play::Playing
        }.last
    end

    def finished_play_by(user)
      return nil if user.nil?

      finished_plays
        .select { |p|
          p.user == user
        }.last
    end

    private
      def set_version
        version = theme.theme_data.size + 1
      end
  end
end