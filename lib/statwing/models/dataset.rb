class Statwing::DataSet
	include Her::Model

	parse_root_in_json true, format: :json_api
	include_root_in_json true

	has_many :users
end