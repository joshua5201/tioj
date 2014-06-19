class RegistrationsController < Devise::RegistrationsController
	def new
		super
	end

	def create
		agent = Mechanize.new
		agent.pluggable_parser.default = Mechanize::Download
		f = agent.get('http://avatar.3sd.me/100')
		f.save('public/images/avatar/it_should_be_users_id.png')
		super
	end

	def update
		super
	end
end 