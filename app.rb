#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sqlite3'
require 'sinatra/activerecord'
require 'sinatra/reloader'

set :database, {adapter: "sqlite3", database: "barbershop.sqlite3"}

class YourApplication < Sinatra::Base
	register Sinatra::ActiveRecordExtension
end

class Clients < ActiveRecord::Base
end

class Barbers < ActiveRecord::Base
end

get '/' do

	erb :index
end

get '/listOfBarbers' do
	@barbers = Barbers.all
	erb :listOfBarbers
end

get '/visit' do 
	@barbers = Barbers.all
	erb :visit
end

post '/visit' do
	@name = params[:clientname]
	@phone = params[:phone]
	@datestamp = params[:darestamp]
	@color = params[:color]
	@barber = params[:barber]

	erb "<h2>Thank you, you are successfully enlisted</h2>"
end

get '/contacts' do
	"Hello World"
  end

get '/support' do
	erb :support
  end