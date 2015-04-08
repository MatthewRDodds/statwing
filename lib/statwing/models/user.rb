module Statwing
	class User
		include Model
		include Creatable

		has_many :datasets
	end
end