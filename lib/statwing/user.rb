class Statwing::User
	include Her::Model
	include_root_in_json true
	has_many :datasets
end