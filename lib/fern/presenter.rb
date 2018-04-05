require 'fern/presenter/dsl'

module Fern
  module Presenter
    extend ActiveSupport::Concern

    attr_reader :presenter

    included do
      def present(object, **opts)
        render json: render_presenter(object, **opts)
      end

      def render_presenter(object, **opts)
        presenter = fern[action_name.to_sym][:presenter]

        if object.is_a?(Array) || object.is_a?(ActiveRecord::Relation)
          object.map { |el| presenter.new(el).as_json(**opts) }
        else
          presenter.new(object).as_json(**opts)
        end
      end
    end
  end
end
