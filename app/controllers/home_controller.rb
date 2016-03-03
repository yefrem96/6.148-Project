class HomeController < ApplicationController
	def homepage
	end
	
	def about
	end
	
	def index
		if user_signed_in?
			redirect_to :controller=>'musictracks', :action => 'index'
		end
	end
end
