class Model
	include Resource
	include Virtus.model

	def data
		{ resource_name => attributes }
	end

	def resource_name
		self.class.to_s.demodulize.downcase
	end

	def resource_location
		URI("https://www.statwing.com/api/p0/#{resource_name.pluralize}")
	end
end