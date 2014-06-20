class RegistrationsController < Devise::RegistrationsController
	def new
		super
	end

	def create
		super
		agent = Mechanize.new
		agent.pluggable_parser.default = Mechanize::Download
		f = agent.get('http://avatar.3sd.me/100')
		f.save("public/images/avatar/#{resource.id}.png")
	end

	def update
		super
	end
end 