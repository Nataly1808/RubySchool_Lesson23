#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'

get '/' do
	erb "Hello! <a href=\"https://github.com/bootstrap-ruby/sinatra-bootstrap\">Original</a> pattern has been modified for <a href=\"http://rubyschool.us/\">Ruby School</a>"			
end

get '/about' do
	erb :about
end
get '/vizit' do
	erb :vizit
end

post '/vizit' do
	@username = params[:username]
	@phone = params[:phone]
	@datetime = params[:datetime]

	@title = 'Thank you!'
	@message = "Dear #{@username}, we'll be waiting for you at #{@datetime}"
	
	f = File.open './public/users.txt' , 'a'
	f.write "User: #{@username}, Phone: #{@phone}, Date and time: #{@datetime}"
	f.close

	erb :message
	
end

post '/contacts' do
	@email = params[:email]
	@text = params[:text]
	
	@title = 'Thank you!'
		
	f = File.open './public/contacs.txt' , 'a'
	f.write "Email: #{@email}, Text: #{@text}"
	f.close

	erb :message
	
end
