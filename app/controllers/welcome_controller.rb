class WelcomeController < ApplicationController
	def index
	end
	def last_problem
		@problem = Problem.last
	end
end
