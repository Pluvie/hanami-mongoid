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
      define_method :create do |model_instance|
        if model_instance.is_a? self.model_klass
          model_instance.save
        else
          self.model_klass.create(model_instance)
        end
      end

      ##
      # Forwards common repository methods to the model instance
      %i( destroy delete update_attributes update ).each do |method|
        define_method method do |entity_id, *args|
          self.model_klass.find(entity_id).send method, *args
        end
      end

      ##
      # Forwards common repository methods to the model's collection
      %i( insert_many aggregate ).each do |method|
        define_method method do |*args|
          self.model_klass.collection.send method, *args
        end
      end

    end
  end
end
