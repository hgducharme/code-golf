class TagsController < ApplicationController

	def show
  	@tag = Tag.find(params[:id])
  	@tag.articles
	end

	def index
		@tags = Tag.all
	end

	def destroy
		@tag = Tag.find(params[:id])
		@tag.destroy

		flash.notice = "'#{@tag.name.capitalize}' was successfully deleted!"
		redirect_to tags_path
	end

end
