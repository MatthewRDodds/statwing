module Statwing
	class User
		include Her::Model

		include_root_in_json true
		parse_root_in_json true, format: :json_api

		has_many :datasets

		# alias_method :partner_user_identity, :partner_user_id
		# alias_method :partner_user_identity=, :partner_user_id=
	end
end