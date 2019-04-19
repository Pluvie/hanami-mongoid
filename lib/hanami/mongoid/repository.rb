module Hanami
  module Mongoid
    class Repository

      ##
      # Model class
      #
      # @return [Class] the model class
      def model_klass
        Object.const_get self.class.name.gsub('Repository', '')
      end

      ##
      # Forwards common repository methods to the model
      %i( find find_by where any_of all first last
          destroy_all delete_all update_all ).each do |method|
        define_method method do |*args|
          self.model_klass.send method, *args
        end
      end

      ##
      # Forwards create method to accept a model instance
      define_method :create do |entity_instance|
        unless entity_instance.is_a? self.model_klass
          entity_instance = self.model_klass.new(entity_instance)
        end
        entity_instance.save(validate: false)
        entity_instance
      end

      ##
      # Forwards update methods to accept a model instance
      %i( update_attributes update ).each do |method|
        define_method :update do |entity_id, entity_attributes|
          entity_instance = self.model_klass.find(entity_id)
          if entity_instance.present?
            entity_instance.assign_attributes(entity_attributes)
            entity_instance.save(validate: false)
            entity_instance
          end
        end
      end

      ##
      # Forwards common repository methods to the model instance
      %i( destroy delete ).each do |method|
        define_method method do |entity_id|
          self.model_klass.find(entity_id)&.send method
        end
      end

      ##
      # Forwards common repository methods to the model's collection
      %i( insert_many delete_many aggregate ).each do |method|
        define_method method do |*args|
          self.model_klass.collection.send method, *args
        end
      end

    end
  end
end
