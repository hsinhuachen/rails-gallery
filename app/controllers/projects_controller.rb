class ProjectsController < ApplicationController
	def index
		@posts = Project.all
	end

	def show
		@post = Project.find(params[:id])
	end


	def create

	end


end
