module Hanami
  module Mongoid
    class Repository

      ##
      # Model class
      #
      # @return [Class] the model class
      def self.model_klass
        Object.const_get self.name.gsub('Repository', '')
      end

      ##
      # Forwards common repository methods to the model's class
      %i( find where any_of all first last
          new create update_all destroy_all delete_all ).each do |method|
        define_singleton_method method do |*args|
          puts self.inspect
          self.model_klass.send method, *args
        end
      end

      ##
      # Forwards common repository methods to the model's instance
      %i( update_attributes update destroy delete ).each do |method|
        define_method method do |*args|
          self.send method, *args
        end
      end

      ##
      # Forwards common repository methods to the model's collection
      %i( insert_many aggregate ).each do |method|
        define_singleton_method method do |*args|
          self.model_klass.collection.send method, *args
        end
      end

    end
  end
end
