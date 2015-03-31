class Statwing::DataSet
	include Her::Model
	include_root_in_json true
	has_many :users
end