class Admin::SearchController < ApplicationController

  before_action :authenticate_admin!

	def search
	  @model = params[:model]
	  search = params[:search]
	  word = params[:word]
		if @model == 'client'
			@client = Client.search(search,word)
		else
			@product = Product.search(search,word)
		end
	end

end
