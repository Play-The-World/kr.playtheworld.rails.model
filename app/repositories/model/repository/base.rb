# Reference
# https://www.monterail.com/blog/repository-pattern-active-record
# https://www.nopio.com/blog/how-to-organize-large-rails-applications/

module Model
  module Repository
    class RecordNotFoundError < StandardError; end
    
    # TODO Model별 Repository만들기
    class Base
      attr_reader :entity

      def initialize(entity = nil)
        @entity = entity
      end

      def all
        dataset
      end
      
      def first
        dataset.first
      end
      
      def last
        dataset.last
      end
      
      def find(id)
        dataset.find(id)
      rescue ActiveRecord::RecordNotFound => e
        raise RecordNotFoundError, e
      end

      def find_by(attributes)
        entity.find_by(**attributues)
      rescue ActiveRecord::RecordNotFound => e
        raise RecordNotFoundError, e
      end
      
      def create(attributes)
        entity.create(**attributues)
      end
      
      def update(id:, attributes:)
        find(id).update(**attributes)
      end
      
      def destroy(id)
        find(id).destroy
      end
      
      private
        def entity
          @entity ? @entity : raise(NotImplementedError)
        end
        
        def dataset
          entity.all
        end
    end
  end
  
end