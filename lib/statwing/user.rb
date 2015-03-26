class Statwing::User
	RESOURCE_LOCATION = URI('https://www.statwing.com/api/p0/users')
	include Resource
	include Virtus.model

	attribute :partner_user_identity, String

	def data
		{ user: self.attributes }
	end
end