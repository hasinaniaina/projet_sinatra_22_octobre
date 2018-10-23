require 'gossip' 
require 'csv'
class ApplicationController < Sinatra::Base
  	get '/' do
  		 erb :index, locals: {gossips: Gossip.all}
	end
	get '/gossips/new/' do 
		erb :new_gossip
	end
	post '/gossips/new/' do
  		Gossip.new(params["gossip_author"],params["gossip_content"]).save
  		redirect "/"
	end
	get '/gossips/:id/' do
		 erb :gossip_profil, locals: {gossips: Gossip.find(params['id'])}
	end
	get '/gossips/edition/:id/' do
		 erb :edit_gossip, locals: {gossips: Gossip.find(params['id'])}
	end
	post '/gossips/edition/:id/' do
		 Gossip.new(params["gossip_author"],params["gossip_content"],params['id']).edit(params['id'],)
	end
end