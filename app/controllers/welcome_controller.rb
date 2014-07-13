class WelcomeController < ApplicationController
	def index
		@problem_last = Problem.last
		@submission_last = Submission.last
	end
end
