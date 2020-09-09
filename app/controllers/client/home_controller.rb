class Client::HomeController < ApplicationController
  def top
  	@genres  =Genre.all
  end

  def about
  end
end
