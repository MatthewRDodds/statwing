module Statwing
  module Model
    extend ActiveSupport::Concern

    included do
      include Her::Model

      include_root_in_json true
      parse_root_in_json true, format: :json_api
    end
  end
end
