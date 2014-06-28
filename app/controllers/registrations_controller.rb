class RegistrationsController < Devise::RegistrationsController
	def new
		super
	end

	def create
		super
                resource.remote_avatar_url = "http://avatar.3sd.me/100"
                resource.save
	end

	def update
		super
	end
end 