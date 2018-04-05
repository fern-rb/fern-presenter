require 'fern/api'

module Fern
  module Presenter
    module Dsl
      def self.included(receiver)
        receiver.extend(ClassMethods)
      end

      module ClassMethods
      end

      def presenter(klass)
        @controller.fern[@name][:presenter] = klass
      end
    end
  end
end

Fern::Api::Endpoint.class_eval { include Fern::Presenter::Dsl }
