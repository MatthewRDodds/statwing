module Statwing
  module Creatable
    extend ActiveSupport::Concern

    module ClassMethods
      def element_name
        @element_name ||= model_name.element.to_sym
      end

      def root
        @root ||= root_element.to_s
      end

      def create(attrs)
        new post_raw(root, Hash[element_name, attrs])[:parsed_data][:data]
      end
    end
  end
end