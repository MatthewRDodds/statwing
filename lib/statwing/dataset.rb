class Statwing::DataSet < Model
	attribute :fileurl, String
	attribute :name, String
	attribute :fileurl, Boolean
	attribute :shared, String, default: 'restricted'
	attribute :action, String
	attribute :users, Array
end