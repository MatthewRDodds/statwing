class Statwing::DataSet
	RESOURCE_LOCATION = URI('https://www.statwing.com/api/p0/datasets')
	include Resource
	include Virtus.model

	attribute :fileurl, String
	attribute :name, String
	attribute :fileurl, Boolean
	attribute :shared, String, default: 'restricted'
	attribute :action, String
	attribute :users, Array

	def data
		{ dataset: self.attributes }
	end
end